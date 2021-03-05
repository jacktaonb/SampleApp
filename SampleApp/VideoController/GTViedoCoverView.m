//
//  GTViedoCoverView.m
//  SampleApp
//
//  Created by 王韬 on 2021/3/2.
//

#import "GTViedoCoverView.h"
#import "GTVideoPlayer.h"
#import "GTVideoToolbar.h"


@interface GTViedoCoverView()

@property(nonatomic, strong, readwrite) UIImageView *coverView;
@property(nonatomic, strong, readwrite) UIImageView *playButton;
@property(nonatomic, copy, readwrite) NSString *videoUrl;
@property(nonatomic, strong, readwrite)GTVideoToolbar *toolbar;

@end

@implementation GTViedoCoverView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _coverView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,frame.size.width,frame.size.height - GTVideoToolbarHeight)];
            _coverView;
        })];
        
        [_coverView addSubview:({
            _playButton = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 50)/2,(frame.size.height - 50 - GTVideoToolbarHeight)/2,100,100)];
            _playButton.image = [UIImage imageNamed:@"play"];
            _playButton;
        })];
        
        [self addSubview:({
            _toolbar = [[GTVideoToolbar alloc] initWithFrame:CGRectMake(0, _coverView.bounds.size.height, frame.size.width, GTVideoToolbarHeight)];
            _toolbar;
        })];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapToPlay)];
        [self addGestureRecognizer:tapGesture];
        
    }
    return self;
}

- (void) dealloc{
    
    
}
#pragma mark - public
- (void)layoutWithViedoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl{
    _coverView.image = [UIImage imageNamed:videoCoverUrl];
    _videoUrl = videoUrl;
    [_toolbar layoutWithModel:nil];
}

#pragma mark - private  http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4
- (void)_tapToPlay{
    [[GTVideoPlayer Player] playViedoWithUrl:_videoUrl attachView:_coverView];
   
}


@end
