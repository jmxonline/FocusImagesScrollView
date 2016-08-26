//
//  XMFoucusImageScrollView.m
//  FocusImagesScrollView
//
//  Created by jimmy on 16/8/25.
//  Copyright © 2016年 jmxonline@sina.com. All rights reserved.
//  https://github.com/jmxonline

#import "XMFoucusSwipeView.h"
@interface XMFoucusSwipeView ()

@property (nonatomic, strong) NSTimer *autoScrollTimer;

@end

@implementation XMFoucusSwipeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)startAutoScrollTimer
{
    if (!_autoScrollTimer) {
        _autoScrollTimer = [NSTimer timerWithTimeInterval:2.5 target:self selector:@selector(scrollToNext) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:self.autoScrollTimer forMode:NSRunLoopCommonModes];
    }
}

- (void)scrollToNext
{
    NSInteger toIndex = self.currentItemIndex + 1;
    [self scrollToItemAtIndex:toIndex duration:0.5];
}

- (void)cancelAutoScrollTimer
{
    if (_autoScrollTimer) {
        [_autoScrollTimer invalidate];
        _autoScrollTimer = nil;
    }
}

@end
