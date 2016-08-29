//
//  XMBaseViewController.h
//  FocusImagesScrollView
//
//  Created by jimmy on 16/8/24.
//  Copyright © 2016年 jmxonline@sina.com. All rights reserved.
//  https://github.com/jmxonline

#import <UIKit/UIKit.h>

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
