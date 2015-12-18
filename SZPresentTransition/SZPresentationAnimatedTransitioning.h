//
//  SZPresentationAnimatedTransitioning.h
//  SZPresentTransition
//
//  Created by 陈圣治 on 15/12/18.
//  Copyright © 2015年 shengzhichen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SZPresentationAnimatedTransitioning : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic) BOOL presention;

- (instancetype)initWithPresention:(BOOL)presention;

@end
