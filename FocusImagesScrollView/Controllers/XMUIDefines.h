//
//  XMUIDefines.h
//  FocusImagesScrollView
//
//  Created by jimmy on 16/8/29.
//  Copyright © 2016年 jmxonline@sina.com. All rights reserved.
//

#ifndef XMUIDefines_h
#define XMUIDefines_h

#define colorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define colorFromRGBA(rgbValue,trans) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:trans]
#define kOnePixelsLineHeight        1/[UIScreen mainScreen].scale
#define LSTR(str)       NSLocalizedString(str, nil)

#define MoveTo(view, x, y)          view.frame = CGRectMake(x, y, view.frame.size.width, view.frame.size.height)

#define kTextColorHighlight colorFromRGB(0xf86442)
#define LOG_SEL  LOGCA(@"**%@ -%@**", NSStringFromClass(self.class), NSStringFromSelector(_cmd))


#endif /* XMUIDefines_h */
