//   https://github.com/CoderMJLee/MJRefresh
//  MJRefreshLegendHeader.m
//  MJRefreshExample
//
//  Created by MJ Lee on 15/3/4.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "MJRefreshLegendHeader.h"
#import "MJRefreshConst.h"
#import "UIView+MJExtension.h"

@interface MJRefreshLegendHeader()
@property (nonatomic, weak) UIImageView *arrowImage;
@property (nonatomic, weak) UIImageView *activityImage;
@property (nonatomic, weak) UIActivityIndicatorView *activityView;
@end

@implementation MJRefreshLegendHeader
#pragma mark - 懒加载
- (UIImageView *)arrowImage
{
    if (!_arrowImage) {
        UIImageView *arrowImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:MJRefreshSrcName(@"arrow.png")]];
        [self addSubview:_arrowImage = arrowImage];
    }
    return _arrowImage;
}

- (UIActivityIndicatorView *)activityView
{
    if (!_activityView) {
        UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        activityView.bounds = self.arrowImage.bounds;
        [self addSubview:_activityView = activityView];
    }
    return _activityView;
}

- (UIImageView *)activityImage
{
    if (!_activityImage) {
        UIImageView *activityImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"activityLvImage.png"]];
        CGRect rect = CGRectMake(activityImage.frame.origin.x, activityImage.frame.origin.y, 26, 26);
        activityImage.frame = rect;
        [self addSubview:_activityImage = activityImage];
    }
    _activityImage.hidden = YES;
    return _activityImage;
}

#pragma mark - 初始化
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 箭头
    CGFloat arrowX = (self.stateHidden && self.updatedTimeHidden) ? self.mj_w * 0.5 : (self.mj_w * 0.5 - 100);
    self.arrowImage.center = CGPointMake(arrowX, self.mj_h * 0.5);
    
    // 指示器
    self.activityView.center = self.arrowImage.center;
    
    //舞动的小驴
    self.activityImage.center = self.arrowImage.center;
}

#pragma mark - 公共方法
#pragma mark 设置状态
- (void)setState:(MJRefreshHeaderState)state
{
    if (self.state == state) return;
    
    // 旧状态
    MJRefreshHeaderState oldState = self.state;
    
    switch (state) {
        case MJRefreshHeaderStateIdle: {
            if (oldState == MJRefreshHeaderStateRefreshing) {
                self.arrowImage.transform = CGAffineTransformIdentity;
                
                [UIView animateWithDuration:MJRefreshSlowAnimationDuration animations:^{
                    self.activityImage.hidden = YES;
                } completion:^(BOOL finished) {
                    self.activityImage.hidden = YES;
                    self.arrowImage.alpha = 1.0;
                }];
            } else {
                [UIView animateWithDuration:MJRefreshFastAnimationDuration animations:^{
                    self.arrowImage.transform = CGAffineTransformIdentity;
                }];
            }
            break;
        }
            
        case MJRefreshHeaderStatePulling: {
            [UIView animateWithDuration:MJRefreshFastAnimationDuration animations:^{
                self.arrowImage.transform = CGAffineTransformMakeRotation(0.000001 - M_PI);
            }];
            break;
        }
            
        case MJRefreshHeaderStateRefreshing: {
            self.activityImage.hidden = NO;
            self.arrowImage.alpha = 0.0;
            break;
        }
            
        default:
            break;
    }
    
    // super里面有回调，应该在最后面调用
    [super setState:state];
}

@end
