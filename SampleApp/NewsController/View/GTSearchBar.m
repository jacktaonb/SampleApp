//
//  GTSearchBar.m
//  SampleApp
//
//  Created by 王韬 on 2021/5/5.
//

#import "GTSearchBar.h"

@interface GTSearchBar()<UITextFieldDelegate>
@property(nonatomic, strong, readwrite)UITextField *textField;

@end

@implementation GTSearchBar

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self addSubview:({
            _textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, frame.size.width - 20, frame.size.height - 10)];
            _textField.backgroundColor = [UIColor whiteColor];
            _textField.delegate = self;
            _textField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1"]];
            _textField.leftViewMode = UITextFieldViewModeAlways;
            _textField.placeholder = @"今日热点推荐";
            _textField;
        })];
    }
    return self;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"");
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"");
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    //字数判断
    return YES;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_textField resignFirstResponder];
    return YES;
}
@end
