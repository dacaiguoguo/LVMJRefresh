//   https://github.com/CoderMJLee/MJRefresh
//  UIScrollView+MJRefresh.h
//  MJRefreshExample
//
//  Created by MJ Lee on 15/3/4.
//  Copyright (c) 2015年 itcast. All rights reserved.
//  给ScrollView增加下拉刷新、上拉刷新的功能

#import <UIKit/UIKit.h>
#import "MJRefreshConst.h"

@class MJRefreshGifHeader, MJRefreshLegendHeader, MJRefreshHeader;
@class MJRefreshGifFooter, MJRefreshLegendFooter, MJRefreshFooter;

@interface UIScrollView (MJRefresh)
#pragma mark - 访问下拉刷新控件
/** 下拉刷新控件 */
@property (strong, nonatomic, readonly) MJRefreshHeader *header;
/** gif功能的下拉刷新控件 */
@property (nonatomic, readonly) MJRefreshGifHeader *gifHeader;
/** 传统的下拉刷新控件 */
@property (nonatomic, readonly) MJRefreshLegendHeader *legendHeader;

#pragma mark - 添加下拉刷新控件
/**
 * 添加一个传统的下拉刷新控件
 *
 * @param block 进入刷新状态就会自动调用这个block
 */
- (MJRefreshLegendHeader *)addLegendHeaderWithRefreshingBlock:(void (^)())block;
/**
 * 添加一个传统的下拉刷新控件
 *
 * @param block     进入刷新状态就会自动调用这个block
 * @param dateKey   用来记录刷新时间的key
 */
- (MJRefreshLegendHeader *)addLegendHeaderWithRefreshingBlock:(void (^)())block dateKey:(NSString *)dateKey;
/**
 * 添加一个传统的下拉刷新控件
 *
 * @param target 进入刷新状态就会自动调用target对象的action方法
 * @param action 进入刷新状态就会自动调用target对象的action方法
 */
- (MJRefreshLegendHeader *)addLegendHeaderWithRefreshingTarget:(id)target refreshingAction:(SEL)action;
/**
 * 添加一个传统的下拉刷新控件
 *
 * @param target    进入刷新状态就会自动调用target对象的action方法
 * @param action    进入刷新状态就会自动调用target对象的action方法
 * @param dateKey   用来记录刷新时间的key
 */
- (MJRefreshLegendHeader *)addLegendHeaderWithRefreshingTarget:(id)target refreshingAction:(SEL)action dateKey:(NSString *)dateKey;
/**
 * 添加一个gif图片的下拉刷新控件
 *
 * @param block 进入刷新状态就会自动调用这个block
 */
- (MJRefreshGifHeader *)addGifHeaderWithRefreshingBlock:(void (^)())block;
/**
 * 添加一个gif图片的下拉刷新控件
 *
 * @param block     进入刷新状态就会自动调用这个block
 * @param dateKey   用来记录刷新时间的key
 */
- (MJRefreshGifHeader *)addGifHeaderWithRefreshingBlock:(void (^)())block dateKey:(NSString *)dateKey;
/**
 * 添加一个gif图片的下拉刷新控件
 *
 * @param target 进入刷新状态就会自动调用target对象的action方法
 * @param action 进入刷新状态就会自动调用target对象的action方法
 */
- (MJRefreshGifHeader *)addGifHeaderWithRefreshingTarget:(id)target refreshingAction:(SEL)action;
/**
 * 添加一个gif图片的下拉刷新控件
 *
 * @param target    进入刷新状态就会自动调用target对象的action方法
 * @param action    进入刷新状态就会自动调用target对象的action方法
 * @param dateKey   用来记录刷新时间的key
 */
- (MJRefreshGifHeader *)addGifHeaderWithRefreshingTarget:(id)target refreshingAction:(SEL)action dateKey:(NSString *)dateKey;

#pragma mark - 移除下拉刷新控件
/**
 * 移除下拉刷新控件
 */
- (void)removeHeader;

#pragma mark - 访问上拉刷新控件
/** 上拉刷新控件 */
@property (strong, nonatomic, readonly) MJRefreshFooter *footer;
/** gif功能的上拉刷新控件 */
@property (nonatomic, readonly) MJRefreshGifFooter *gifFooter;
/** 传统的上拉刷新控件 */
@property (nonatomic, readonly) MJRefreshLegendFooter *legendFooter;

#pragma mark - 添加上拉刷新控件
- (MJRefreshLegendFooter *)addLegendFooterWithRefreshingBlock:(void (^)())block offsetBottom:(int)offset;
/**
 * 添加一个传统的上拉刷新控件
 *
 * @param block 进入刷新状态就会自动调用这个block
 */
- (MJRefreshLegendFooter *)addLegendFooterWithRefreshingBlock:(void (^)())block;
/**
 * 添加一个传统的上拉刷新控件
 *
 * @param target 进入刷新状态就会自动调用target对象的action方法
 * @param action 进入刷新状态就会自动调用target对象的action方法
 */
- (MJRefreshLegendFooter *)addLegendFooterWithRefreshingTarget:(id)target refreshingAction:(SEL)action offsetBottom:(int)offset;;
/**
 * 添加一个gif图片的上拉刷新控件
 *
 * @param block 进入刷新状态就会自动调用这个block
 */
- (MJRefreshGifFooter *)addGifFooterWithRefreshingBlock:(void (^)())block offsetBottom:(int)offset;
/**
 * 添加一个gif图片的上拉刷新控件
 *
 * @param target 进入刷新状态就会自动调用target对象的action方法
 * @param action 进入刷新状态就会自动调用target对象的action方法
 */
- (MJRefreshGifFooter *)addGifFooterWithRefreshingTarget:(id)target refreshingAction:(SEL)action offsetBottom:(int)offset;

#pragma mark - 移除上拉刷新控件
/**
 * 移除上拉刷新控件
 */
- (void)removeFooter;
@end

