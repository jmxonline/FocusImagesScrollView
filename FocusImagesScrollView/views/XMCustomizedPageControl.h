//
//  XMCustomizedPageControl.h
//  FocusImagesScrollView
//
//  Created by jimmy on 16/8/29.
//  Copyright © 2016年 jmxonline@sina.com. All rights reserved.
//  https://github.com/jmxonline

#import <UIKit/UIKit.h>
/**
 *  simulate the UIPageControl,show a smaller pageControl.
 *  exactly say,it is a indicator,looks like sinaNews-homepage-foucus.
 */
@interface XMCustomizedPageControl : UIControl

@property (nonatomic, assign) NSInteger currentPage, numberOfPages;

@property (nonatomic, assign) NSInteger gapWidth, radius, indicatorRadius;

@property (nonatomic, assign) BOOL hidesForSinglePage;

@property (nonatomic, strong) UIColor *trackColor, *pageIndicatorTintColor;

- (void)updateCurrentPageDisplay;

- (CGSize)sizeForNumberOfPages:(NSInteger)pageCount;

@end
