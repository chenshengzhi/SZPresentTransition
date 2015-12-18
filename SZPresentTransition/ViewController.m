//
//  ViewController.m
//  SZPresentTransition
//
//  Created by 陈圣治 on 15/12/18.
//  Copyright © 2015年 shengzhichen. All rights reserved.
//

#import "ViewController.h"
#import "SZViewController.h"
#import "SZPresentationAnimatedTransitioning.h"

@interface ViewController () <UIViewControllerTransitioningDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)presentHandle:(id)sender {
    SZViewController *vc = [[SZViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self dismissViewControllerAnimated:YES completion:nil];
        });
    }];
}

@end
