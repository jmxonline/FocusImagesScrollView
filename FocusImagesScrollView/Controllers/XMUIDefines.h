//
//  XMUIDefines.h
//  FocusImagesScrollView
//
//  Created by jimmy on 16/8/29.
//  Copyright © 2016年 jmxonline@sina.com. All rights reserved.
//

#ifndef XMUIDefines_h
#define XMUIDefines_h

#import "MyLogger.h"

#define colorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define colorFromRGBA(rgbValue,trans) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:trans]
#define kOnePixelsLineHeight        1/[UIScreen mainScreen].scale
#define LSTR(str)       NSLocalizedString(str, nil)

#define MoveTo(view, x, y)          view.frame = CGRectMake(x, y, view.frame.size.width, view.frame.size.height)

#define kTextColorHighlight colorFromRGB(0xf86442)
#define LOG_SEL  LOGCA(@"**%@ -%@**", NSStringFromClass(self.class), NSStringFromSelector(_cmd))

// 增大触摸区域 (使用给定值)
#define MAKE_LARGE_BY(view, rect, w, h)  do {\
CGRect rect2 = rect;  \
CGFloat width = w, height = h; \
rect2.size.width += width; \
rect2.size.height += height; \
rect2.origin.x -= width/2; \
rect2.origin.y -= height/2; \
view.frame = rect2; \
} while (0)

// 一级文字font: 发布的专辑、今晚80后2014
#define     kTextFontLevel1         [UIFont fontWithName:@"HelveticaNeue" size:17]//[UIFont systemFontOfSize:16.0]
// 二级文字font: 动态转采声音文字内容
#define     kTextFontLevel2         [UIFont fontWithName:@"HelveticaNeue-Light" size:14]//[UIFont systemFontOfSize:12.0]
// 二级文字font: 粉丝数、播放数、By某人
#define     kTextFontLevel3         [UIFont fontWithName:@"HelveticaNeue-Light" size:12]//[UIFont systemFontOfSize:10.0]

#define kTextColorLevelFirst     colorFromRGB(0x333333) //一级颜色值
#define kTextColorLevelSecond    colorFromRGB(0x666666) //二级颜色值
#define kTextColorLevelThird     colorFromRGB(0x999999) //三级颜色值
#define kSystemBrandColor    colorFromRGB(0xfc5832) //系统品牌色
#define kLightGrayTextColor colorFromRGB(0xffa3b3c2) //亮灰色
#define KLightGrayColor colorFromRGB(0xFFE8E8E8) //深灰色
#define kGrayColor colorFromRGB(0xcfcfcf) //灰色

#endif /* XMUIDefines_h */
