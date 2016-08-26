//
//  SwipeView+XMFocusScroll.h
//  FocusImagesScrollView
//
//  Created by jimmy on 16/8/24.
//  Copyright © 2016年 jmxonline@sina.com. All rights reserved.
//

#import "SwipeView.h"

@interface SwipeView (XMFocusScroll)

- (void)startAutoScrollTimer;
- (void)cancelAutoScrollTimer;
- (void)addPageControl;

@end
