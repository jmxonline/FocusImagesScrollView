//
//  XMSoundBoxPlayBar.m
//  FocusImagesScrollView
//
//  Created by jimmy on 16/9/9.
//  Copyright © 2016年 jmxonline@sina.com. All rights reserved.
//

#import "XMSoundBoxPlayBar.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "XMUIDefines.h"
#import "UIView+YYAdd.h"

@interface XMSoundBoxPlayBar()
{
    UIImageView* _coverView;
    UIImage* _coverImage;
    BOOL _rotateLaunched;
    BOOL _isLayerRotating;
    
    CGFloat _screenW;
    CGFloat _screenH;
    
    UIButton *_playButton, *_prevButton, *_nextButton;
}
@end

@implementation XMSoundBoxPlayBar

- (void)dealloc
{
    LOG_SEL;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setTrackCover:(UIImage *)cover
{
    _coverView.image = cover;
}

- (void)setTrackCoverURL:(NSURL *)url
{
    UIImage* placeholder = _coverView.image?:[UIImage imageNamed:@"xx"];
    [_coverView sd_setImageWithURL:url placeholderImage:placeholder options:SDWebImageRefreshCached];
}

- (CALayer*)coverLayer
{
    return _coverView.layer;
}

- (void)startRotateLayer:(CALayer*)layer
{
    if (_rotateLaunched) return;
    _rotateLaunched = YES;
    CABasicAnimation *anim;
    anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    anim.duration = 12;
    anim.removedOnCompletion = NO;
    anim.fromValue = [NSNumber numberWithFloat:0];
    anim.toValue = [NSNumber numberWithFloat:M_PI*2];
    anim.repeatCount = NSNotFound;
    [layer addAnimation:anim forKey:@"animateTransform"];
}

- (void)pauseRotateLayer:(CALayer*)layer
{
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
}

- (void)resumeRotateLayer:(CALayer*)layer
{
    CFTimeInterval pausedTime = [layer timeOffset];
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    layer.beginTime = timeSincePause;
}

- (void)setup
{
    self.userInteractionEnabled = YES;
    CGFloat const barH = 60.0;
    self.backgroundColor = [UIColor yellowColor];
    _screenW = [UIScreen mainScreen].bounds.size.width;
    _screenH = [UIScreen mainScreen].bounds.size.height;
    CGRect rect = CGRectMake(0, _screenH - barH, _screenW, barH);
    self.frame = rect;
    
    rect = CGRectMake(0, 0, barH, barH);
    _coverView = [[UIImageView alloc] initWithFrame:rect];
    [self addSubview:_coverView];
    
    // play item
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setAccessibilityLabel:LSTR(@"播放或暂停")];
    [button setImage:[UIImage imageNamed:@"toolbar_play_n_p"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"toolbar_play_h_p"] forState:UIControlStateHighlighted];
    //[play_btn addTarget:self action:@selector(onPlay:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    _playButton = button;
    
    // prev item
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setAccessibilityLabel:LSTR(@"上一首")];
    [button setImage:[UIImage imageNamed:@"toolbar_prev_n_p"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"toolbar_prev_h_p"] forState:UIControlStateHighlighted];
    [button setImage:[UIImage imageNamed:@"toolbar_prev_d_p"] forState:UIControlStateDisabled];
    //[prev_btn addTarget:self action:@selector(onPre:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    _prevButton = button;
    
    // next item
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setAccessibilityLabel:LSTR(@"下一首")];
    [button setImage:[UIImage imageNamed:@"toolbar_next_n_p"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"toolbar_next_h_p"] forState:UIControlStateHighlighted];
    [button setImage:[UIImage imageNamed:@"toolbar_next_d_p"] forState:UIControlStateDisabled];
    //[next_btn addTarget:self action:@selector(onNext:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    _nextButton = button;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [_playButton sizeToFit];
    [_prevButton sizeToFit];
    [_nextButton sizeToFit];
    MoveTo(_nextButton, self.width - 30, (self.height - _nextButton.height)/2);
    MoveTo(_playButton, _nextButton.left - _playButton.width - 20, (self.height - _playButton.height)/2);
    MoveTo(_prevButton, _playButton.left - _prevButton.width - 20, _nextButton.top);
}

- (void)setHidden:(BOOL)hidden animated:(BOOL)animated
{
    [self setHidden:hidden animated:animated completion:NULL];
}

- (void)setHidden:(BOOL)hidden animated:(BOOL)animated completion:(void(^)(BOOL finished))completion
{
    CGFloat y = _screenH;
    if (!hidden) {
        y = _screenH - self.bounds.size.height;
    }
    CGRect frame = self.frame;
    frame.origin.y = y;
    if (!animated) {
        self.frame = frame;
        return;
    }
    [UIView animateWithDuration:.25 delay:.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.frame = frame;
    } completion:^(BOOL finished) {
        if (completion) {
            completion(finished);
        }
    }];
}

- (void)updateStateIfNeed
{
    if ([_delegate playBarShouldPlaying]) {
        if (_isLayerRotating) {
            return;
        }
        if (_rotateLaunched) {
            [self resumeRotateLayer:self.coverLayer];
        }
        else {
            [self startRotateLayer:self.coverLayer];
        }
        _isLayerRotating = YES;
    }
    else {
        [self pauseRotateLayer:self.coverLayer];
        _isLayerRotating = NO;
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
