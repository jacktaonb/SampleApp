//
//  GTSplashView.m
//  SampleApp
//
//  Created by 王韬 on 2021/4/18.
//

#import "GTSplashView.h"
@interface GTSplashView()

@property(nonatomic, strong, readwrite)UIButton *button;

@end

@implementation GTSplashView

- (instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.image = [UIImage imageNamed:@"splash"];
        [self addSubview:({
            _button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
            _button.backgroundColor = [UIColor lightGrayColor];
            [_button setTitle:@"跳过" forState:UIControlStateNormal];
            [_button addTarget:self action:@selector(_removeSplashView) forControlEvents:UIControlEventTouchUpInside];
            _button;
        })];
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)_removeSplashView{
    [self removeFromSuperview];
}


@end
