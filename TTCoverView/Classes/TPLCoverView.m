//
//  TPLCoverView.m
//  duoweiNews
//
//  Created by tiperTan_HGST_7200_1T on 2017/9/7.
//  Copyright © 2017年 tiperTan_HGST_7200_1T. All rights reserved.
//

#import "TPLCoverView.h"
#import <TT_Category/UIView+tt_category.h>
#import <TT_Category/NSObject+tt_category.h>

#define DEFAULT_animationInterval 0.3

@interface TPLCoverView ()<UIGestureRecognizerDelegate>

@end

@implementation TPLCoverView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame coverBackgroundView:(UIView *)coverBackgroundView baseView:(UIView *)baseView
{
    self = [super initWithFrame:frame];
    if (self) {
        _coverBackgroundView = coverBackgroundView;
        _coverBackgroundView.clipsToBounds = YES;
        
        UITapGestureRecognizer * tapOne = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBackgroundView)];
        tapOne.delegate = self;
        [_coverBackgroundView addGestureRecognizer:tapOne];
        
        UITapGestureRecognizer * tapOneToSelf = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapSelf)];
        tapOneToSelf.delegate = self;
        [self addGestureRecognizer:tapOneToSelf];

        
        _animationInterval = DEFAULT_animationInterval;
        _baseView = baseView;
        _baseView.userInteractionEnabled = YES;
    }
    return self;
}

//初始化方法
- (instancetype)initWithFrame:(CGRect)frame coverBackgroundView:(UIView *)coverBackgroundView
{
  return  [self initWithFrame:frame coverBackgroundView:coverBackgroundView baseView:[UIApplication sharedApplication].keyWindow];
    
}

- (instancetype)initWithFrame:(CGRect)frame backgroundView:(UIView *)backgroundView
{
    self.ys = 0.5;
    self.newSize = CGSizeMake(200, 200);
    return  [self initWithFrame:frame coverBackgroundView:backgroundView baseView:[NSObject tt_frontVC].view];
}


//打开
- (void)show:(BOOL)animated
{
    if(self.show) {
        self.show(animated);
    }else {
        [self subShow:animated needReset:YES];
    }
    
}

- (void)show:(BOOL)animated needReset:(BOOL)reset
{
    if(self.show) {
        self.show(animated);
    }else {
        [self subShow:animated needReset:reset];
    }
    
}

- (void)subShow:(BOOL)animated needReset:(BOOL)reset
{
    [_baseView addSubview:_coverBackgroundView];
    if(reset)
    {
        _coverBackgroundView.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
        self.tt_top = _coverBackgroundView.tt_height;
    }
    [_coverBackgroundView addSubview:self];
    typeof(self) __weak weak_self = self;
    if(animated) {
        [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
        [UIView animateWithDuration:self.animationInterval animations:^{
            typeof(weak_self) __strong strong_self = weak_self;
            strong_self.coverBackgroundView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
            strong_self.tt_top = strong_self.coverBackgroundView.tt_height - strong_self.tt_height;
        } completion:^(BOOL finished) {
            [[UIApplication sharedApplication] endIgnoringInteractionEvents];
        }];
    }else {
        _coverBackgroundView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
        self.tt_top = self.coverBackgroundView.tt_height - self.tt_height;
    }
}
//关闭
- (void)close:(BOOL)animated
{
    if(self.close) {
        self.close(animated);
    }else {
        [self subClose:animated needReset:YES];
    }
}
- (void)close:(BOOL)animated needReset:(BOOL)reset
{
    if(self.close) {
        self.close(animated);
    }else {
        [self subClose:animated needReset:reset];
    }
}

- (void)subClose:(BOOL)animated needReset:(BOOL)reset
{
    if(reset)
    {
        _coverBackgroundView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    }
    typeof(self) __weak weak_self = self;
    if(animated) {
        [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
        [UIView animateWithDuration:self.animationInterval animations:^{
            typeof(weak_self) __strong strong_self = weak_self;
            strong_self.coverBackgroundView.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
            strong_self.tt_top = strong_self.coverBackgroundView.tt_height;
        } completion:^(BOOL finished) {
            typeof(weak_self) __strong strong_self = weak_self;
            [strong_self removeFromSuperview];
            [strong_self.coverBackgroundView removeFromSuperview];
            [[UIApplication sharedApplication] endIgnoringInteractionEvents];
        }];
    }else {
        [self removeFromSuperview];
        [_coverBackgroundView removeFromSuperview];
    }
}


- (void)tapBackgroundView
{
    [self close:YES];
}

- (void)tapSelf
{
    
}






//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
//   
//    if([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]){
//        return NO;
//    }
//    return YES;
//}

@end
