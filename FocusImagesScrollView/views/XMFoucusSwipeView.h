//
//  XMFoucusImageScrollView.h
//  FocusImagesScrollView
//
//  Created by jimmy on 16/8/25.
//  Copyright © 2016年 jmxonline@sina.com. All rights reserved.
//  https://github.com/jmxonline

#import "SwipeView.h"
/**
 *  可能要接一个ALi百川商城的SDK，接口还没定好。
 需要一个focusImage，原app里面的跟业务高耦合了。git上搜了下，暂时没找到合适的~
 用UICollectionview 做一个也可以，测试debug费时~
 https://github.com/nicklockwood 的这个swipeView 和 iCarousel类似，学习下ß
 */

@interface XMFoucusSwipeView : SwipeView
/**
 *  auto scroll,
 use as a pair<startAutoScrollTimer,cancelAutoScrollTimer> ifNeed;
 */
- (void)startAutoScrollTimer;
- (void)cancelAutoScrollTimer;

@end
