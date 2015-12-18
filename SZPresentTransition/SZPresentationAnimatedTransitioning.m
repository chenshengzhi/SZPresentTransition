//
//  SZPresentationAnimatedTransitioning.m
//  SZPresentTransition
//
//  Created by 陈圣治 on 15/12/18.
//  Copyright © 2015年 shengzhichen. All rights reserved.
//

#import "SZPresentationAnimatedTransitioning.h"

@implementation SZPresentationAnimatedTransitioning

- (instancetype)initWithPresention:(BOOL)presention {
    if (self = [super init]) {
        _presention = presention;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView = [transitionContext containerView];
    if (_presention) {
        UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
        
        [containerView addSubview:toView];
        toView.transform = CGAffineTransformMakeScale(0.001, 0.001);
        toView.alpha = 0;
        toView.center = CGPointMake(containerView.frame.size.width/2, containerView.frame.size.height/2);
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            toView.alpha = 1.0;
            toView.transform = CGAffineTransformIdentity;
            toView.center = CGPointMake(containerView.frame.size.width/2, containerView.frame.size.height/2);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:finished];
        }];
    } else {
        UIView *fromeView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
        
        [containerView insertSubview:toView belowSubview:fromeView];
        fromeView.center = CGPointMake(containerView.frame.size.width/2, containerView.frame.size.height/2);
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            fromeView.alpha = 0;
            fromeView.transform = CGAffineTransformMakeScale(0.001, 0.001);
            fromeView.center = CGPointMake(containerView.frame.size.width/2, containerView.frame.size.height/2);
        } completion:^(BOOL finished) {
            [fromeView removeFromSuperview];
            [transitionContext completeTransition:finished];
        }];
    }
}

@end
