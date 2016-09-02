//
//  XMBaseViewController.m
//  FocusImagesScrollView
//
//  Created by jimmy on 16/8/24.
//  Copyright © 2016年 jmxonline@sina.com. All rights reserved.
//  https://github.com/jmxonline

#import "XMBaseViewController.h"
#import "MyLogger.h"
#import "XMUIDefines.h"
#import "MustOverride.h"

NSString* const kNormalCell = @"Cell";
#define kDefaultBackgroundColor [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1]

@interface XMBaseViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation XMBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = kDefaultBackgroundColor;
    if (_isStyleTable) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kNormalCell];
        [self.view addSubview:_tableView];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- override method
- (void)dealloc
{
    //SUBCLASS_MUST_OVERRIDE;
    LOG_SEL;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//do not override.
- (void)didMoveToParentViewController:(UIViewController *)parent
{
    SUBCLASS_CANNOT_OVERRIDE;
    [super didMoveToParentViewController:parent];
    if (!parent) {
        [self cancelRetainObjects];
    }
}

- (void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion
{
    [super dismissViewControllerAnimated:flag completion:completion];
    [self cancelRetainObjects];
}

#pragma mark- try to avoid retainCycle-leak.
//Maybe release-timer in viewDidDisappear is better.
//subclass override.
- (void)cancelRetainObjects
{
    LOG_SEL;
    NSParameterAssert([[NSThread currentThread] isMainThread]);
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end

@implementation MXNavigationController

+ (void)initialize
{
    if (self == [MXNavigationController class]) {
        [self.class customizeStyle];
        [self.class customizeBackButton];
    }
}

+ (void)customizeBackButton
{
    // Note that images configured as the back bar button's background do
    // not have the current tintColor applied to them, they are displayed
    // as it.
    UIImage *backButtonBackgroundImage = [UIImage imageNamed:@"return"];
    // The background should be pinned to the left and not stretch.
    backButtonBackgroundImage = [backButtonBackgroundImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, backButtonBackgroundImage.size.width - 1, 0, 0)];
    
    id appearance = [UIBarButtonItem appearanceWhenContainedIn:[MXNavigationController class], nil];
    [appearance setBackButtonBackgroundImage:backButtonBackgroundImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
}

+ (void)customizeStyle
{
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTintColor:kTextColorHighlight];
}

@end
