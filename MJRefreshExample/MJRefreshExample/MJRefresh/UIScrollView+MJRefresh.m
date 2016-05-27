//   https://github.com/CoderMJLee/MJRefresh
//  UIScrollView+MJRefresh.m
//  MJRefreshExample
//
//  Created by MJ Lee on 15/3/4.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "UIScrollView+MJRefresh.h"
#import "MJRefreshGifHeader.h"
#import "MJRefreshLegendHeader.h"
#import "MJRefreshGifFooter.h"
#import "MJRefreshLegendFooter.h"
#import <objc/runtime.h>

@implementation UIScrollView (MJRefresh)
#pragma mark - 下拉刷新
- (MJRefreshLegendHeader *)addLegendHeaderWithRefreshingBlock:(void (^)())block dateKey:(NSString *)dateKey
{
    MJRefreshLegendHeader *header = [self addLegendHeader];
    header.refreshingBlock = block;
    header.dateKey = dateKey;
    return header;
}

- (MJRefreshLegendHeader *)addLegendHeaderWithRefreshingTarget:(id)target refreshingAction:(SEL)action dateKey:(NSString *)dateKey
{
    MJRefreshLegendHeader *header = [self addLegendHeader];
    header.refreshingTarget = target;
    header.refreshingAction = action;
    header.dateKey = dateKey;
    return header;
}

- (MJRefreshLegendHeader *)addLegendHeaderWithRefreshingTarget:(id)target refreshingAction:(SEL)action
{
    return [self addLegendHeaderWithRefreshingTarget:target refreshingAction:action dateKey:nil];
}

- (MJRefreshLegendHeader *)addLegendHeaderWithRefreshingBlock:(void (^)())block
{
    return [self addLegendHeaderWithRefreshingBlock:block dateKey:nil];
}

- (MJRefreshLegendHeader *)addLegendHeader
{
    MJRefreshLegendHeader *header = [[MJRefreshLegendHeader alloc] init];
    self.header = header;
    
    return header;
}

- (MJRefreshGifHeader *)addGifHeaderWithRefreshingBlock:(void (^)())block dateKey:(NSString *)dateKey
{
    MJRefreshGifHeader *header = [self addGifHeader];
    header.refreshingBlock = block;
    header.dateKey = dateKey;
    return header;
}

- (MJRefreshGifHeader *)addGifHeaderWithRefreshingTarget:(id)target refreshingAction:(SEL)action dateKey:(NSString *)dateKey
{
    MJRefreshGifHeader *header = [self addGifHeader];
    header.refreshingTarget = target;
    header.refreshingAction = action;
    header.dateKey = dateKey;
    return header;
}

- (MJRefreshGifHeader *)addGifHeaderWithRefreshingBlock:(void (^)())block
{
    return [self addGifHeaderWithRefreshingBlock:block dateKey:nil];
}

- (MJRefreshGifHeader *)addGifHeaderWithRefreshingTarget:(id)target refreshingAction:(SEL)action
{
    return [self addGifHeaderWithRefreshingTarget:target refreshingAction:action dateKey:nil];
}

- (MJRefreshGifHeader *)addGifHeader
{
    MJRefreshGifHeader *header = [[MJRefreshGifHeader alloc] init];
    self.header = header;
    
    return header;
}

- (void)removeHeader
{
    self.header = nil;
}

#pragma mark - Property Methods
#pragma mark gifHeader
- (MJRefreshGifHeader *)gifHeader
{
    if ([self.header isKindOfClass:[MJRefreshGifHeader class]]) {
        return (MJRefreshGifHeader *)self.header;
    }
    
    return nil;
}

#pragma mark legendHeader
- (MJRefreshLegendHeader *)legendHeader
{
    if ([self.header isKindOfClass:[MJRefreshLegendHeader class]]) {
        return (MJRefreshLegendHeader *)self.header;
    }
    
    return nil;
}

#pragma mark header
static char MJRefreshHeaderKey;
- (void)setHeader:(MJRefreshHeader *)header
{
    if (header != self.header) {
        [self.header removeFromSuperview];
        
        [self willChangeValueForKey:@"header"];
        objc_setAssociatedObject(self, &MJRefreshHeaderKey,
                                 header,
                                 OBJC_ASSOCIATION_ASSIGN);
        [self didChangeValueForKey:@"header"];
        
        [self addSubview:header];
    }
}

- (MJRefreshHeader *)header
{
    return objc_getAssociatedObject(self, &MJRefreshHeaderKey);
}

#pragma mark - 上拉刷新
- (MJRefreshLegendFooter *)addLegendFooterWithRefreshingBlock:(void (^)())block offsetBottom:(int)offset
{
    MJRefreshLegendFooter *footer = [self addLegendFooter:offset];
    footer.offsetFooter = offset;
    footer.refreshingBlock = block;
    return footer;
}


- (MJRefreshLegendFooter *)addLegendFooterWithRefreshingBlock:(void (^)())block
{
    return [self addLegendFooterWithRefreshingBlock:block offsetBottom:0];
}

- (MJRefreshLegendFooter *)addLegendFooterWithRefreshingTarget:(id)target refreshingAction:(SEL)action offsetBottom:(int)offset
{
    MJRefreshLegendFooter *footer = [self addLegendFooter:offset];
    footer.refreshingTarget = target;
    footer.refreshingAction = action;
    return footer;
}

- (MJRefreshLegendFooter *)addLegendFooter:(int)offset
{
    MJRefreshLegendFooter *footer = [[MJRefreshLegendFooter alloc] init];
    footer.offsetFooter = offset;
    self.footer = footer;
    [footer resetHidden:YES];
    return footer;
}

- (MJRefreshGifFooter *)addGifFooterWithRefreshingBlock:(void (^)())block offsetBottom:(int)offset
{
    MJRefreshGifFooter *footer = [self addGifFooter:offset];
    footer.refreshingBlock = block;
    return footer;
}

- (MJRefreshGifFooter *)addGifFooterWithRefreshingTarget:(id)target refreshingAction:(SEL)action offsetBottom:(int)offset
{
    MJRefreshGifFooter *footer = [self addGifFooter:offset];
    footer.refreshingTarget = target;
    footer.refreshingAction = action;
    return footer;
}

- (MJRefreshGifFooter *)addGifFooter:(int)offset
{
    MJRefreshGifFooter *footer = [[MJRefreshGifFooter alloc] init];
    self.footer = footer;
    footer.hidden = YES;
    return footer;
}

- (void)removeFooter
{
    self.footer = nil;
}

static char MJRefreshFooterKey;
- (void)setFooter:(MJRefreshFooter *)footer
{
    if (footer != self.footer) {
        [self.footer removeFromSuperview];
        
        [self willChangeValueForKey:@"footer"];
        objc_setAssociatedObject(self, &MJRefreshFooterKey,
                                 footer,
                                 OBJC_ASSOCIATION_ASSIGN);
        [self didChangeValueForKey:@"footer"];
        
        [self addSubview:footer];
    }
}

- (MJRefreshGifFooter *)gifFooter
{
    if ([self.footer isKindOfClass:[MJRefreshGifFooter class]]) {
        return (MJRefreshGifFooter *)self.footer;
    }
    return nil;
}

- (MJRefreshLegendFooter *)legendFooter
{
    if ([self.footer isKindOfClass:[MJRefreshLegendFooter class]]) {
        return (MJRefreshLegendFooter *)self.footer;
    }
    return nil;
}


- (MJRefreshFooter *)footer
{
    return objc_getAssociatedObject(self, &MJRefreshFooterKey);
}

#pragma mark - swizzle
+ (void)load
{
    Method method1 = class_getInstanceMethod([self class], NSSelectorFromString(@"dealloc"));
    Method method2 = class_getInstanceMethod([self class], @selector(deallocSwizzle));
    method_exchangeImplementations(method1, method2);
}

- (void)deallocSwizzle
{
    [self removeFooter];
    [self removeHeader];
    
    [self deallocSwizzle];
}

@end
