//
//  BossHeaderView.m
//  仿BOSS直聘的刷新
//
//  Created by apple on 16/3/21.
//  Copyright © 2016年 kun. All rights reserved.
//

#import "BossHeaderView.h"
#import "DRFrashLayer.h"

@interface BossHeaderView ()

@property (nonatomic, strong) DRFrashLayer *frashLayer;

@end

@implementation BossHeaderView

#pragma mark - 重写方法
#pragma mark 在这里做一些初始化配置（比如添加子控件）
- (void)prepare
{
    [super prepare];
    //self.backgroundColor = [UIColor lightGrayColor];
    
    // 设置控件的高度
    self.mj_h = 80;
    
//    self.frashLayer = [DRFrashLayer layer];
//    
//    [self.layer addSublayer:_frashLayer];
}

#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];
    if (!self.frashLayer) {
        self.frashLayer = [DRFrashLayer layer];
        _frashLayer.frame = self.bounds;
        _frashLayer.contentsScale = [UIScreen mainScreen].scale;
        [self.layer addSublayer:_frashLayer];
    }
}

#pragma mark 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change {
    [super scrollViewContentOffsetDidChange:change];
}

#pragma mark 监听scrollView的contentSize改变
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change  {
    [super scrollViewContentSizeDidChange:change];
}

#pragma mark 监听scrollView的拖拽状态改变
- (void)scrollViewPanStateDidChange:(NSDictionary *)change {
    [super scrollViewPanStateDidChange:change];
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state {
    MJRefreshCheckState;
    
    switch (state) {
        case MJRefreshStateIdle:
        {
            [self.frashLayer stopAnimation];
        }
            break;
        case MJRefreshStatePulling:
        {
            //这里可以设置状态
            self.frashLayer.complete = 1.0;
            
        }
            break;
        case MJRefreshStateRefreshing:
        {
            [self.frashLayer beginAnimation];
        }
            break;
        default:
            break;
    }
}

#pragma mark 监听拖拽比例（控件被拖出来的比例）
- (void)setPullingPercent:(CGFloat)pullingPercent {
    [super setPullingPercent:pullingPercent];
    self.mj_y = -self.mj_h * MIN(1.0, MAX(0.0, pullingPercent));
    self.frashLayer.complete = MIN(1.0, MAX(0.0, pullingPercent-0.190));
}


@end
