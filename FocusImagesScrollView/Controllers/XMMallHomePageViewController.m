//
//  XMMallHomePageViewController.m
//  FocusImagesScrollView
//
//  Created by jimmy on 16/8/25.
//  Copyright © 2016年 jmxonline@sina.com. All rights reserved.
//

#import "XMMallHomePageViewController.h"
#import "XMFoucusSwipeView.h"
#import "XMCustomizedPageControl.h"
#import "MyLogger.h"
#import "XMUIDefines.h"
#import "PresentTestViewController.h"
#import <objc/runtime.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface XMMallHomePageViewController ()<SwipeViewDataSource, SwipeViewDelegate>

@property (nonatomic, strong) XMFoucusSwipeView* swipeView;
@property (nonatomic, strong) NSMutableArray* items;
@property (nonatomic, strong) XMCustomizedPageControl* pageControl;
@property (nonatomic, strong) NSMutableArray* imgUrls;

@end

@implementation XMMallHomePageViewController

- (void)viewDidLoad {
    self.isStyleTable = YES;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = NSLocalizedString(@"百川商城", nil);
    [self homePageSetup];
    
    [self showIvarNamesWithClass:[UIPageControl class]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showIvarNamesWithClass:(Class)cls
{
    LOGCA(@"--list ivarNames of class[%@]--", NSStringFromClass(cls));
    uint count = 0;
    Ivar *ivars = class_copyIvarList(cls, &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        NSString* ivarName = [NSString stringWithCString:ivar_getName(ivar) encoding:NSUTF8StringEncoding];
        printf(" %s\n", [ivarName UTF8String]);
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.swipeView startAutoScrollTimer];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.swipeView cancelAutoScrollTimer];
}

- (XMFoucusSwipeView *)swipeView
{
    if (!_swipeView) {
        _swipeView = [[XMFoucusSwipeView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 240.)];
        //configure swipeView
        _swipeView.pagingEnabled = YES;
        _swipeView.wrapEnabled = YES;
        _swipeView.delegate = self;
        _swipeView.dataSource = self;
    }
    return _swipeView;
}

- (void)homePageSetup
{
    self.items = [NSMutableArray array];
    for (int i = 0; i < 8; i++)
    {
        [_items addObject:@(i)];
    }
    self.tableView.tableHeaderView = self.swipeView;
    _pageControl = [[XMCustomizedPageControl alloc] init];
    _pageControl.numberOfPages = _items.count;
    [self.swipeView addSubview:_pageControl];
    
    self.imgUrls = [NSMutableArray array];
    for (int i = 0; i < 100; i++) {
        [self.imgUrls addObject:[NSString stringWithFormat:@"https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage%03d.jpg", i]];
    }
}

- (void)pageControlLayout
{
    CGRect frame = _pageControl.frame;
    frame.origin.x = self.swipeView.frame.size.width - frame.size.width - 6.0;
    frame.origin.y = self.swipeView.frame.size.height - frame.size.height - 6.0;
    _pageControl.frame = frame;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self pageControlLayout];
}

- (NSInteger)numberOfItemsInSwipeView:(SwipeView *)swipeView
{
    return _items.count;
}

- (UIView *)swipeView:(SwipeView *)swipeView viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    if (view == nil) {
        UIImageView* imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        view = imageView;
    }
    UIImageView* imageView = (UIImageView*)view;
    NSString* urlString = self.imgUrls[index];
    UIImage* placeholder = [UIImage imageNamed:@"notFound"];
    [imageView setShowActivityIndicatorView:YES];
    [imageView setIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [imageView sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:placeholder options:SDWebImageRefreshCached];
    return view;
}

- (CGSize)swipeViewItemSize:(SwipeView *)swipeView
{
    return self.swipeView.bounds.size;
}

#pragma mark- delegate
- (void)swipeViewWillBeginDragging:(SwipeView *)swipeView
{
    [self.swipeView cancelAutoScrollTimer];
}

- (void)swipeViewDidEndDragging:(SwipeView *)swipeView willDecelerate:(BOOL)decelerate
{
    [self.swipeView startAutoScrollTimer];
}

- (void)swipeViewCurrentItemIndexDidChange:(SwipeView *)swipeView
{
    _pageControl.currentPage = swipeView.currentItemIndex;
    [_pageControl updateCurrentPageDisplay];
}

- (void)swipeView:(SwipeView *)swipeView didSelectItemAtIndex:(NSInteger)index;
{
    LOGCA(@"didSelectItemAtIndex:%zd", index);
    [self presentViewController:[self testViewController] animated:YES completion:NULL];
}

- (UIViewController*)testViewController
{
    PresentTestViewController* viewController = [[PresentTestViewController alloc] init];
    UINavigationController* navi = [[UINavigationController alloc] initWithRootViewController:viewController];
    return navi;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kNormalCell];
    cell.textLabel.text = [NSString stringWithFormat:@"Cell-%zd", indexPath.row];
    return cell;
}
@end
