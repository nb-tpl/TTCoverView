//
//  NSObject+fitBasePlus.h
//  duoweiNews
//
//  Created by tiperTan_HGST_7200_1T on 2017/5/27.
//  Copyright © 2017年 tiperTan_HGST_7200_1T. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//实际屏幕宽和高
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height


#define IS_IPHONE_X ((ScreenHeight == 812.0f ||ScreenHeight == 896.0f) ? YES : NO)

#define FitValue(value) ([NSObject fitFloatValue:value])
#define FitIP6PTValue(value) ([NSObject fitIP6PTValue:value])




#define Height_TabBar_NOT_X  (FitValue(136))
#define Height_ToolBar_Not_X (FitValue(120))

#define Height_Navi_Not_X (FitValue(132 + 54))
#define Height_BigNavi_Not_X (FitValue(120 + 86 + 80))


#define Height_Navi    ((IS_IPHONE_X==YES) ? 88.0f: Height_Navi_Not_X)
#define Height_Head_Navi_Temp (Height_Navi - Height_Navi_Not_X)

#define Height_BigNavi    (Height_BigNavi_Not_X + Height_Head_Navi_Temp)



#define Height_TabBar    ((IS_IPHONE_X==YES) ? 83.0f: Height_TabBar_NOT_X)
#define Height_TabBar_Temp (Height_TabBar - Height_TabBar_NOT_X)
#define Height_ToolBar    (Height_ToolBar_Not_X + Height_TabBar_Temp)





@interface NSObject (fitBasePlus)


+(CGFloat)fitFloatValue:(CGFloat)floatValue;
+(CGFloat)fitIP6PTValue:(CGFloat)ptValue;

@end
