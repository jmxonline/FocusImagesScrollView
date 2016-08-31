//
//  XMCustomizedPageControl.m
//  FocusImagesScrollView
//
//  Created by jimmy on 16/8/29.
//  Copyright © 2016年 jmxonline@sina.com. All rights reserved.
//

#import "XMCustomizedPageControl.h"
#import "XMUIDefines.h"
#import "MyLogger.h"
@implementation XMCustomizedPageControl{
    CGFloat _margin;
}

+ (void)initialize
{
    if (self == [XMCustomizedPageControl class]) {
        XMCustomizedPageControl* appearance = [XMCustomizedPageControl appearance];
        [appearance setBackgroundColor:[UIColor clearColor]];
        [appearance setTrackColor:colorFromRGB(0xE0E0E0)];
        [appearance setPageIndicatorTintColor:[UIColor whiteColor]];
        [appearance setRadius:2.0];
        [appearance setGapWidth:5.0];
        [appearance setIndicatorRadius:3.2];
    }
}

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGRect frame = CGRectZero;
    frame.size = [self sizeForNumberOfPages:_numberOfPages];
    self.frame = frame;
}

- (void)setNumberOfPages:(NSInteger)numberOfPages
{
    if (_numberOfPages != numberOfPages) {
        _numberOfPages = numberOfPages;
        [self setNeedsLayout];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)drawRect:(CGRect)rect
{
    if (_hidesForSinglePage && _numberOfPages < 2) {
        return;
    }
    CGFloat diameter = 2*_radius;
    CGFloat indicatorDiameter = 2*_indicatorRadius;
    CGContextRef context = UIGraphicsGetCurrentContext();
    for (int i = 0; i < self.numberOfPages; i++)
    {
        CGFloat x = 0.0;
        if (i == _currentPage)
        {
            x = _margin + i*(diameter + _gapWidth) - (_indicatorRadius - _radius);
            CGContextSetFillColorWithColor(context, [_pageIndicatorTintColor CGColor]);
            CGContextFillEllipseInRect(context, CGRectMake(x, (self.frame.size.height - indicatorDiameter)/2, indicatorDiameter, indicatorDiameter));
        }
        else
        {
            x = _margin + i*(diameter + _gapWidth);
            CGContextSetFillColorWithColor(context, [_trackColor CGColor]);
            CGContextFillEllipseInRect(context, CGRectMake(x,(self.frame.size.height - diameter)/2, diameter, diameter));
        }
    }
}

- (void)updateCurrentPageDisplay
{
    [self setNeedsDisplay];
}

- (CGSize)sizeForNumberOfPages:(NSInteger)pageCount
{
    _margin = 5.0;
    CGSize size = CGSizeZero;
    size.height = pageCount?2*_indicatorRadius:0.;
    size.width = pageCount?((pageCount*2*_radius + (pageCount - 1)*_gapWidth) + 2*_margin):0.;
    return size;
}

@end
