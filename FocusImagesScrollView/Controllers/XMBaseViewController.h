//
//  XMBaseViewController.h
//  FocusImagesScrollView
//
//  Created by jimmy on 16/8/24.
//  Copyright © 2016年 jmxonline@sina.com. All rights reserved.
//  https://github.com/jmxonline

#import <UIKit/UIKit.h>

#define colorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define colorFromRGBA(rgbValue,trans) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:trans]
#define kOnePixelsLineHeight        1/[UIScreen mainScreen].scale
#define LSTR(str)       NSLocalizedString(str, nil)

#define kTextColorHighlight colorFromRGB(0xf86442)
#define LOG_SEL  LOGCA(@"**%@ -%@**", NSStringFromClass(self.class), NSStringFromSelector(_cmd))

extern NSString* const kNormalCell;
@interface XMBaseViewController : UIViewController

@property (nonatomic, assign) BOOL        isStyleTable;
@property (nonatomic, strong) UITableView * tableView;

/**
 *  override ifNeed, to cancel NSTimer etc.(break retainCycle)
 */
- (void)cancelRetainObjects  __attribute__((objc_requires_super));

@end
@interface MXNavigationController : UINavigationController
@end
