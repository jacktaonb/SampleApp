//
//  GTViedoCoverView.m
//  SampleApp
//
//  Created by 王韬 on 2021/3/2.
//

#import "GTViedoCoverView.h"
#import <AVFoundation/AVFoundation.h>

@interface GTViedoCoverView()

@property(nonatomic, strong, readwrite) UIImageView *coverView;
@property(nonatomic, strong, readwrite) UIImageView *playButton;
@property(nonatomic, copy, readwrite) NSString *videoUrl;

@end

@implementation GTViedoCoverView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _coverView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,frame.size.width,frame.size.height)];
            _coverView;
        })];
        
        [self addSubview:({
            _playButton = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 50)/2,(frame.size.height - 50)/2,50,50)];
            _playButton.image = [UIImage imageNamed:@"1"];
            _playButton;
        })];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapToPlay)];
    }
    return self;
}
#pragma mark - public
- (void)layoutWithViedoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl{
    _coverView.image = [UIImage imageNamed:videoCoverUrl];
}

#pragma mark - private
- (void)_tapToPlay{
    NSURL *videoURL = [NSURL URLWithString:_videoUrl];
    AVAsset *asset = [AVAsset assetWithURL:videoURL];
    
    AVPlayerItem *videoItem = [AVPlayerItem playerItemWithAsset:asset];
    
    AVPlayer *avPlayer = [AVPlayer playerWithPlayerItem:videoItem];
    
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:avPlayer];
    playerLayer.frame = _coverView.bounds;
    [_coverView.layer addSublayer:playerLayer];
    [avPlayer play];
}

@end
