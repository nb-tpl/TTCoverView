//
//  TPLCoverView.h
//  duoweiNews
//
//  Created by tiperTan_HGST_7200_1T on 2017/9/7.
//  Copyright © 2017年 tiperTan_HGST_7200_1T. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TPLCoverView : UIView
{
    NSString* filePath;
}
@property(nonatomic,assign)float ys;
@property(nonatomic)CGSize newSize;

//动画时间 默认1秒
@property(nonatomic,assign)NSTimeInterval animationInterval;

@property (nonatomic,weak)UIView * baseView;
@property(nonatomic,readonly)UIView * coverBackgroundView;


@property(nonatomic,strong)NSDictionary * infoDict;


@property(nonatomic,copy)void (^show)(BOOL animation);
@property(nonatomic,copy)void (^close)(BOOL animation);

@property(nonatomic,copy)void (^click)(BOOL animation);

//初始化方法
- (instancetype)initWithFrame:(CGRect)frame coverBackgroundView:(UIView *)coverBackgroundView;
- (instancetype)initWithFrame:(CGRect)frame backgroundView:(UIView *)backgroundView;

//打开
- (void)show:(BOOL)animated;
- (void)show:(BOOL)animated needReset:(BOOL)reset;
////rewirte
//- (void)subShow:(BOOL)animated;
//关闭
- (void)close:(BOOL)animated;
- (void)close:(BOOL)animated needReset:(BOOL)reset;
////rewirte
//- (void)subClose:(BOOL)animated;





@end
