//
//  SZViewController.m
//  SZPresentTransition
//
//  Created by 陈圣治 on 15/12/18.
//  Copyright © 2015年 shengzhichen. All rights reserved.
//

#import "SZViewController.h"
#import "SZPresentationAnimatedTransitioning.h"

@implementation SZViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    self.modalTransitionStyle = UIModalPresentationCustom;
    self.transitioningDelegate = self;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [[SZPresentationAnimatedTransitioning alloc] initWithPresention:YES];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[SZPresentationAnimatedTransitioning alloc] initWithPresention:NO];
}

@end
