//
//  PresentTestViewController.m
//  FocusImagesScrollView
//
//  Created by jimmy on 16/8/25.
//  Copyright © 2016年 jmxonline@sina.com. All rights reserved.
//

#import "PresentTestViewController.h"

@interface PresentTestViewController ()

@end

@implementation PresentTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem* barItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(dismissSelf)];
    self.navigationItem.leftBarButtonItem = barItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismissSelf
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
