//
//  SwipeView+XMFocusScroll.m
//  FocusImagesScrollView
//
//  Created by jimmy on 16/8/24.
//  Copyright © 2016年 jmxonline@sina.com. All rights reserved.
//

#import "SwipeView+XMFocusScroll.h"
#import <objc/runtime.h>

/*
 最近要接一个百川商城的sdk
 在github上找了下，focusImage，暂时没找到好用的。
 
 用collectionview写一个比较麻烦，而且需要测试debug，太费时间了
 nicklockwood 的这个swipView 和iCarousel一脉，非常好用。
 
 ---只是测试下，提供一个思路--
 还没有接口，这个view不完善，会后续更新！
 */

static NSString* const kCurrentItemIndexKey = @"currentItemIndex";
@implementation SwipeView (XMFocusScroll)


- (void)dealloc
{
#warning should not override this method,now just test
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self removeObserver:self forKeyPath:kCurrentItemIndexKey];
}

- (void)addPageControl
{
    UIPageControl* pageCtrl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 30, self.frame.size.width, 10)];
    pageCtrl.numberOfPages = [self numberOfItems];
    pageCtrl.currentPage = self.currentPage;
    pageCtrl.tag = 101;
    [self addSubview:pageCtrl];
    /*
     use KVO here for test.
     
     it is better to addSubview and use delegate in viewController
     - (void)swipeViewCurrentItemIndexDidChange:(SwipeView *)swipeView;
     */
    [self addObserver:self forKeyPath:kCurrentItemIndexKey options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:kCurrentItemIndexKey]) {
        UIView* view = [self viewWithTag:101];
        if ([view isKindOfClass:UIPageControl.class]) {
            UIPageControl*pageCtrl = (UIPageControl*)view;
            pageCtrl.currentPage = self.currentPage;
        }
    }
}

#pragma mark- new for auto scroll
- (NSTimer*)autoScrollTimer
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setAutoScrollTimer:(NSTimer*)timer
{
    objc_setAssociatedObject(self, @selector(autoScrollTimer), timer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)startAutoScrollTimer
{
    if (!self.autoScrollTimer) {
        self.autoScrollTimer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(scrollToNext) userInfo:nil repeats:YES];
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
    if (self.autoScrollTimer) {
        [self.autoScrollTimer invalidate];
        self.autoScrollTimer = nil;
    }
}

@end
