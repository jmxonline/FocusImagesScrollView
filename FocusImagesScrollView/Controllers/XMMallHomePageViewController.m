//
//  XMMallHomePageViewController.m
//  FocusImagesScrollView
//
//  Created by jimmy on 16/8/25.
//  Copyright © 2016年 jmxonline@sina.com. All rights reserved.
//

#import "XMMallHomePageViewController.h"
#import "XMFoucusSwipeView.h"
#import "MyLogger.h"
#import "PresentTestViewController.h"

@interface XMMallHomePageViewController ()<SwipeViewDataSource, SwipeViewDelegate>

@property (nonatomic, strong) XMFoucusSwipeView* swipeView;
@property (nonatomic, strong) NSMutableArray* items;

@end

@implementation XMMallHomePageViewController

- (void)viewDidLoad {
    self.isStyleTable = YES;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = NSLocalizedString(@"百川商城", nil);
    [self homePageSetup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    for (int i = 0; i < 12; i++)
    {
        [_items addObject:@(i)];
    }
    self.tableView.tableHeaderView = self.swipeView;
}

- (NSInteger)numberOfItemsInSwipeView:(SwipeView *)swipeView
{
    return _items.count;
}

- (UIView *)swipeView:(SwipeView *)swipeView viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
#if 1
    UILabel *label = nil;
    //create new view if no view is available for recycling
    if (view == nil)
    {
        //don't do anything specific to the index within
        //this `if (view == nil) {...}` statement because the view will be
        //recycled and used with other index values later
        view = [[UIView alloc] initWithFrame:self.swipeView.bounds];
        view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        label = [[UILabel alloc] initWithFrame:view.bounds];
        label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [label.font fontWithSize:50];
        label.tag = 1;
        [view addSubview:label];
    }
    else
    {
        //get a reference to the label in the recycled view
        label = (UILabel *)[view viewWithTag:1];
    }
    
    //set background color
    CGFloat red = (arc4random()&0xFF)/255.0;
    CGFloat green = (arc4random()&0xFF)/255.0;
    CGFloat blue = (arc4random()&0xFF)/255.0;
    view.backgroundColor = [UIColor colorWithRed:red
                                           green:green
                                            blue:blue
                                           alpha:1.0];
    label.text = [_items[index] stringValue];
#else
    if (view == nil) {
        
    }
    else {
        UIImageView* imageView = view;
    }
#endif
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
