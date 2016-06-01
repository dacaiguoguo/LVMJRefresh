//   https://github.com/CoderMJLee/MJRefresh
//  MJRefreshLegendFooter.m
//  MJRefreshExample
//
//  Created by MJ Lee on 15/3/5.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "MJRefreshLegendFooter.h"
#import "MJRefreshConst.h"
#import "UIView+MJExtension.h"
#import "UIScrollView+MJExtension.h"

@interface MJRefreshLegendFooter()
@property (nonatomic, weak) UIActivityIndicatorView *activityView;
@property (nonatomic, weak) UIImageView *activityImage;
@end

@implementation MJRefreshLegendFooter
#pragma mark - 懒加载
- (UIActivityIndicatorView *)activityView
{
    if (!_activityView) {
        UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [self addSubview:_activityView = activityView];
    }
    return _activityView;
}

- (UIImageView *)activityImage
{
    if (!_activityImage) {
        UIImageView *activityImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:MJRefreshSrcName(@"activityLvImage.png")]];
        CGRect rect = CGRectMake(activityImage.frame.origin.x, activityImage.frame.origin.y, 26, 26);
        activityImage.frame = rect;
        [self addSubview:_activityImage = activityImage];
    }
    _activityImage.hidden = YES;
    return _activityImage;
}

#pragma mark - 初始化方法
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 指示器
    if (self.stateHidden) {
        self.activityImage.center = CGPointMake(self.mj_w * 0.5, self.mj_h * 0.5);
    } else {
        self.activityImage.center = CGPointMake(self.mj_w * 0.5 - 100, self.mj_h * 0.5);
    }
}

#pragma mark - 公共方法
- (void)setState:(MJRefreshFooterState)state
{
    if (self.state == state) return;
    
    switch (state) {
        case MJRefreshFooterStateIdle:
            self.activityImage.hidden = YES;
            break;
            
        case MJRefreshFooterStateRefreshing:
            self.activityImage.hidden = NO;
            break;
            
        case MJRefreshFooterStateNoMoreData:
            self.activityImage.hidden = YES;
            break;
            
        default:
            break;
    }
    
    // super里面有回调，应该在最后面调用
    [super setState:state];
}
@end
