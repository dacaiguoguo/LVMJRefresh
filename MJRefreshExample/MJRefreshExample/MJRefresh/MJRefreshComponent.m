//   https://github.com/CoderMJLee/MJRefresh
//  MJRefreshComponent.m
//  MJRefreshExample
//
//  Created by MJ Lee on 15/3/4.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "MJRefreshComponent.h"
#import "MJRefreshConst.h"
#import "UIView+MJExtension.h"

@interface MJRefreshComponent()
/** 记录scrollView刚开始的inset */
@property (assign, nonatomic) UIEdgeInsets scrollViewOriginalInset;
/** 父控件 */
@property (weak, nonatomic) UIScrollView *scrollView;
@end

@implementation MJRefreshComponent
#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 基本属性
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.backgroundColor = [UIColor clearColor];
        
        // 默认文字颜色和字体大小
        self.textColor = MJRefreshLabelTextColor;
        self.font = MJRefreshLabelFont;
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    
    // 旧的父控件
    [self.superview removeObserver:self forKeyPath:MJRefreshContentOffset context:nil];
    
    if (newSuperview) { // 新的父控件
        [newSuperview addObserver:self forKeyPath:MJRefreshContentOffset options:NSKeyValueObservingOptionNew context:nil];
        
        // 设置宽度
        self.mj_w = newSuperview.mj_w;
        // 设置位置
        self.mj_x = 0;
        
        // 记录UIScrollView
        self.scrollView = (UIScrollView *)newSuperview;
        // 设置永远支持垂直弹簧效果
        self.scrollView.alwaysBounceVertical = YES;
        // 记录UIScrollView最开始的contentInset
        self.scrollViewOriginalInset = self.scrollView.contentInset;
    }
}

#pragma mark - 公共方法
- (void)setRefreshingTarget:(id)target refreshingAction:(SEL)action
{
    self.refreshingTarget = target;
    self.refreshingAction = action;
}

- (void)beginRefreshing
{
    
}

- (void)endRefreshing
{
    
}

- (BOOL)isRefreshing {
    return NO;
}
@end
