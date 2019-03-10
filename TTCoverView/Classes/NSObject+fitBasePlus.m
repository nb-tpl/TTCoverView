//
//  NSObject+fitBasePlus.m
//  duoweiNews
//
//  Created by tiperTan_HGST_7200_1T on 2017/5/27.
//  Copyright © 2017年 tiperTan_HGST_7200_1T. All rights reserved.
//

#import "NSObject+fitBasePlus.h"

@implementation NSObject (fitBasePlus)
#define fitiPhone472iPhone55 (414.0f/375.0f)
#define fitiPhone42iPhone47  (375.0f/320.f)

#define tempValue (414.0f/1080.0f)
//实际屏幕宽和高
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

//根据1080P分辨率切图，值为px
+(CGFloat)fitFloatValue:(CGFloat)floatValue
{
    
    //4寸
    CGFloat realPoint = floatValue * tempValue;
    if (ScreenWidth < 375) {
        return ((realPoint/fitiPhone472iPhone55)/fitiPhone42iPhone47);
    }else if(ScreenWidth < 414)//4.7
    {
        return realPoint/fitiPhone472iPhone55;
    }else {//5.5

        return realPoint;
    }
}
//根据iPhone6的PT值适配
+(CGFloat)fitIP6PTValue:(CGFloat)ptValue
{
    
    //4寸
//    CGFloat realPoint = floatValue * tempValue;
    if (ScreenWidth < 375) {
        return ptValue/fitiPhone42iPhone47;
    }else if(ScreenWidth < 414)//4.7
    {
        return ptValue;
    }else {//5.5
        
        return ptValue * fitiPhone472iPhone55;
    }
}



@end
