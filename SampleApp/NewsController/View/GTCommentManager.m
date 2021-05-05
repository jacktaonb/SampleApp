//
//  GTCommentManager.m
//  SampleApp
//
//  Created by 王韬 on 2021/5/5.
//

#import "GTCommentManager.h"
#import <UIKit/UIKit.h>

@interface GTCommentManager()<UITextViewDelegate>

@property(nonatomic, strong, readwrite) UIView *backgroundView;
@property(nonatomic, strong, readwrite) UITextView *textView;

@end

@implementation GTCommentManager


+(GTCommentManager *)sharedManager{
    static GTCommentManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[GTCommentManager alloc] init];
    });
    return manager;
}

-(instancetype)init{
    self = [super init];
    if(self){
        _backgroundView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        _backgroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
        [_backgroundView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapBackground)] ];
        [_backgroundView addSubview:({
            _textView = [[UITextView alloc] initWithFrame:CGRectMake(0, _backgroundView.bounds.size.height, UIScreen.mainScreen.bounds.size.width, 100)];
            _textView.backgroundColor = [UIColor whiteColor];
            _textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
            _textView.layer.borderWidth = 5.f;
            _textView.delegate = self;
            _textView;
        })];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_doTextViewAnimationWithNotification:) name:UIKeyboardWillChangeFrameNotification object:nil];
    }
    return self;
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)showCommentView{
    UIWindow *window = [[[UIApplication sharedApplication] windows] objectAtIndex:0];
    [window addSubview:_backgroundView];
    [_textView becomeFirstResponder];
}

-(void)_tapBackground{
    [_textView resignFirstResponder];
    [_backgroundView removeFromSuperview];
}

- (void)_doTextViewAnimationWithNotification:(NSNotification *)noti{
    CGFloat duration = [[noti.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGRect keyboardFrame = [[noti.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];

    if (keyboardFrame.origin.y >= UIScreen.mainScreen.bounds.size.height) {
        //收起
        [UIView animateWithDuration:duration animations:^{
            self.textView.frame = CGRectMake(0, self.backgroundView.bounds.size.height, UIScreen.mainScreen.bounds.size.width, 100);
        }];
    }else{
        self.textView.frame = CGRectMake(0, self.backgroundView.bounds.size.height, UIScreen.mainScreen.bounds.size.width, 100);
        [UIView animateWithDuration:duration animations:^{
            self.textView.frame = CGRectMake(0, self.backgroundView.bounds.size.height - keyboardFrame.size.height - 100, UIScreen.mainScreen.bounds.size.width, 100);
        }];
    }
}


@end
