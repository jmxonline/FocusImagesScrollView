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
#import "CBAutoScrollLabel.h"

@interface XMSoundBoxPlayBar()
{
    UIImageView* _coverView;
    UIImage* _coverImage;
    CBAutoScrollLabel* _trackLabel;
    UILabel* _albumLabel;
    
    BOOL _rotateLaunched;
    BOOL _isLayerRotating;
    
    CGFloat _screenW;
    CGFloat _screenH;
    
    UIButton *_favButton;
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

- (void)setup
{
    self.userInteractionEnabled = YES;
    CGFloat const barH = 60.0;
    CGFloat const coverH = 50.0;
    self.backgroundColor = [UIColor colorWithRed:247.0/255.0 green:248.0/255.0 blue:249.0 alpha:1];
    _screenW = [UIScreen mainScreen].bounds.size.width;
    _screenH = [UIScreen mainScreen].bounds.size.height;
    CGRect rect = CGRectMake(0, _screenH - barH, _screenW, barH);
    self.frame = rect;
    
    rect = CGRectMake(8, (barH - coverH)/2 , coverH, coverH);
    _coverView = [[UIImageView alloc] initWithFrame:rect];
    _coverView.layer.masksToBounds = YES;
    _coverView.layer.cornerRadius = _coverView.width/2;
    [self addSubview:_coverView];
    
    rect = CGRectMake(_coverView.right + 6, 10, self.width - 230, 20);
    _trackLabel = [[CBAutoScrollLabel alloc] initWithFrame:rect];
    _trackLabel.text = @"声音名称";
    _trackLabel.font = kTextFontLevel1;
    _trackLabel.textColor = kTextColorLevelFirst;
    _trackLabel.labelSpacing = 40.f;
    [_trackLabel observeApplicationNotifications];
    [self addSubview:_trackLabel];
    
    _albumLabel = [[UILabel alloc] init];
    _albumLabel.font = kTextFontLevel2;
    _albumLabel.textColor = kTextColorLevelSecond;
    _albumLabel.text = @"专辑名称";
    [_albumLabel sizeToFit];
    rect = CGRectMake(_coverView.right + 6, 10 + _trackLabel.height, _trackLabel.width - 10, _albumLabel.height);
    _albumLabel.frame = rect;
    [self addSubview:_albumLabel];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setAccessibilityLabel:LSTR(@"收藏")];
    [button setImage:[UIImage imageNamed:@"plu_fav"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onFavButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    _favButton = button;
    // play item
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setAccessibilityLabel:LSTR(@"播放或暂停")];
    [button setImage:[UIImage imageNamed:@"toolbar_play_n_p"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"toolbar_play_h_p"] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(onPlayButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    _playButton = button;
    
    // prev item
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setAccessibilityLabel:LSTR(@"上一首")];
    [button setImage:[UIImage imageNamed:@"toolbar_prev_n_p"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"toolbar_prev_h_p"] forState:UIControlStateHighlighted];
    [button setImage:[UIImage imageNamed:@"toolbar_prev_d_p"] forState:UIControlStateDisabled];
    [button addTarget:self action:@selector(onPrevButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    _prevButton = button;
    
    // next item
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setAccessibilityLabel:LSTR(@"下一首")];
    [button setImage:[UIImage imageNamed:@"toolbar_next_n_p"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"toolbar_next_h_p"] forState:UIControlStateHighlighted];
    [button setImage:[UIImage imageNamed:@"toolbar_next_d_p"] forState:UIControlStateDisabled];
    [button addTarget:self action:@selector(onNextButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    _nextButton = button;
    
    [_playButton sizeToFit];
    [_prevButton sizeToFit];
    [_nextButton sizeToFit];
    [_favButton sizeToFit];
    MoveTo(_nextButton, self.width - 30, (self.height - _nextButton.height)/2);
    MoveTo(_playButton, _nextButton.left - _playButton.width - 20, (self.height - _playButton.height)/2);
    MoveTo(_prevButton, _playButton.left - _prevButton.width - 20, _nextButton.top);
    MoveTo(_favButton, _prevButton.left - _favButton.width - 30, (self.height - _favButton.height)/2);
    
    MAKE_LARGE_BY(_prevButton, _prevButton.frame, 20, 20);
    MAKE_LARGE_BY(_nextButton, _nextButton.frame, 20, 20);
    MAKE_LARGE_BY(_favButton, _favButton.frame, 20, 20);
}

- (void)setTrackCover:(UIImage *)cover
{
    _coverView.image = cover;
}

- (void)setTrackCoverURL:(NSURL *)url
{
    UIImage* placeholder = _coverView.image?:[UIImage imageNamed:@"sound_default"];
    [_coverView sd_setImageWithURL:url placeholderImage:placeholder options:SDWebImageRefreshCached];
}

- (void)setTrackTitle:(NSString *)track albumTitle:(NSString *)album
{
    _trackLabel.text = track;
    _albumLabel.text = album;
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

- (BOOL)isPlaying
{
    if ([_delegate respondsToSelector:@selector(playBarShouldPlaying)]) {
        return [_delegate playBarShouldPlaying];
    }
    return NO;
}

- (void)updateStateIfNeed
{
    if (self.isPlaying) {
        if (!_isLayerRotating) {
            if (_rotateLaunched) {
                [self resumeRotateLayer:self.coverLayer];
            }
            else {
                [self startRotateLayer:self.coverLayer];
            }
        }
        _isLayerRotating = YES;
    }
    else {
        if (_isLayerRotating) {
            [self pauseRotateLayer:self.coverLayer];
            _isLayerRotating = NO;
        }
    }
    [self setPlayButtonState:!_isLayerRotating];
}

- (void)setPlayButtonState:(BOOL)isPaused
{
    if (isPaused) {
        [_playButton setImage:[UIImage imageNamed:@"toolbar_play_n_p"] forState:UIControlStateNormal];
        [_playButton setImage:[UIImage imageNamed:@"toolbar_play_h_p"] forState:UIControlStateHighlighted];
    }
    else {
        [_playButton setImage:[UIImage imageNamed:@"toolbar_pause_n_p"] forState:UIControlStateNormal];
        [_playButton setImage:[UIImage imageNamed:@"toolbar_pause_h_p"] forState:UIControlStateHighlighted];
    }
}

#pragma mark- button event
- (void)onPlayButtonClicked:(id)sender
{
    if ([_delegate respondsToSelector:@selector(playBar:didTogglePlayPause:)]) {
        LOGCA(@"%@", NSStringFromSelector(_cmd));
        [_delegate playBar:self didTogglePlayPause:sender];
    }
}

- (void)onPrevButtonClicked:(id)sender
{
    if ([_delegate respondsToSelector:@selector(playBar:didClickedPrevious:)]) {
        LOGCA(@"%@", NSStringFromSelector(_cmd));
        [_delegate playBar:self didClickedPrevious:sender];
    }
}

- (void)onNextButtonClicked:(id)sender
{
    if ([_delegate respondsToSelector:@selector(playBar:didClickedNext:)]) {
        LOGCA(@"%@", NSStringFromSelector(_cmd));
        [_delegate playBar:self didClickedNext:sender];
    }
}

- (void)onFavButtonClicked:(id)sender
{
    if ([_delegate respondsToSelector:@selector(playBar:didClickedFav:)]) {
        LOGCA(@"%@", NSStringFromSelector(_cmd));
        [_delegate playBar:self didClickedFav:sender];
    }
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
#pragma mark -coverLayer rotation
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
    anim.duration = 9.0;
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


@end
