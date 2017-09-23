//
//  DYRefreshFooter.m
//  MJRefreshCustom
//
//  Created by 田向阳 on 2017/9/23.
//  Copyright © 2017年 田向阳. All rights reserved.
//

#import "DYRefreshFooter.h"

static CGFloat imageWidth = 40.f; //控制gif图的大小防止图片过大溢出

@implementation DYRefreshFooter

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSArray *images = [self images];
        [self setImages:images forState:MJRefreshStateRefreshing];
        [self setImages:@[images.firstObject] forState:MJRefreshStatePulling];
        [self setImages:@[images.firstObject] forState:MJRefreshStateIdle];
        [self setImages:@[images.firstObject] forState:MJRefreshStateWillRefresh];
    }
    return self;
}

- (NSArray *)images
{
    NSMutableArray *images = [NSMutableArray array];
    for (int i = 1; i<= 10; i ++) {
        NSString *name = [NSString stringWithFormat:@"loading_%d",i];
        UIImage *image = [UIImage imageNamed:name];
        if (image) {
            [images addObject:image];
        }
    }
    return  images;
}

- (void)placeSubviews
{
    [super placeSubviews];
    CGFloat width = CGRectGetWidth(self.superview.frame);
    self.mj_h = 70;
    self.gifView.frame = CGRectMake((width - imageWidth) * 0.5, 5, imageWidth, imageWidth);
    self.stateLabel.frame = CGRectMake(0, self.gifView.mj_y + imageWidth + 2, width, 28);
    self.gifView.contentMode = UIViewContentModeScaleAspectFit; // 一般都为方图，调整填充模式
}

- (void)prepare
{
    [super prepare];
    self.stateLabel.textAlignment = NSTextAlignmentCenter;
}


@end
