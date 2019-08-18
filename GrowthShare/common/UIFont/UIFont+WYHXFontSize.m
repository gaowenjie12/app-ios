//
//  UIFont+WYHXFontSize.m
//  WYHXGameProject
//
//  Created by weiyi on 2018/7/6.
//  Copyright © 2018年 liubo. All rights reserved.
//

// 使用方法：直接导入UIFont+WYHXFontSize文件就可以

#import "UIFont+WYHXFontSize.h"

#define MyUIScreen  375 // UI设计原型图的手机尺寸宽度(6s), 6p的--414

#define IS_IPHONE_4 ([[UIScreen mainScreen] bounds].size.height == 480.0f)
#define IS_IPHONE_5 ([[UIScreen mainScreen] bounds].size.height == 568.0f)
#define IS_IPHONE_6 ([[UIScreen mainScreen] bounds].size.height == 667.0f)
#define IS_IPHONE_6_PLUS ([[UIScreen mainScreen] bounds].size.height == 736.0f)

// 这里设置iPhone6放大的字号数（现在是缩小2号，也就是iPhone6上字号为17，在iPhone4s和iPhone5上字体为15时，）
#define IPHONE5_INCREMENT 2
// 这里设置iPhone6Plus放大的字号数（现在是放大1号，也就是iPhone6上字号为17，在iPhone6P上字体为18时）
#define IPHONE6PLUS_INCREMENT 1


@implementation UIFont (WYHXFontSize)
+(void)load{
    
    //获取替换后的类方法
    Method newMethod = class_getClassMethod([self class], @selector(adjustFont:));
    //获取替换前的类方法
    Method method = class_getClassMethod([self class], @selector(systemFontOfSize:));
    //然后交换类方法
    method_exchangeImplementations(newMethod, method);
    
}

//在6p上字体扩大1.5倍
//+(UIFont *)adjustFont:(CGFloat)fontSize{
//
//    UIFont *newFont = nil;
//    if (IS_IPHONE_6_PLUS){
//        newFont = [UIFont adjustFont:fontSize * 1.5];
//    }else{
//        newFont = [UIFont adjustFont:fontSize];
//    }
//    return newFont;
//}

//以6s未基准（因为一般UI设计是以6s尺寸为基准设计的）的字体。在5s和6P上会根据屏幕尺寸，字体大小会相应的扩大和缩小
+ (UIFont *)adjustFont:(CGFloat)fontSize {
    UIFont *newFont = nil;
    newFont = [UIFont adjustFont:fontSize * [UIScreen mainScreen].bounds.size.width/MyUIScreen];
    return newFont;
}

//以6s未基准（因为一般UI设计是以6s尺寸为基准设计的）的字体。在5s和6P上会根据屏幕尺寸，字体大小会相应的扩大和缩小
//在6s上字号是17,在6P是上字号扩大到18号（字号扩大1个字号），在4s和5s上字号缩小到15号字（字号缩小2个字号）
//+(UIFont *)adjustFont:(CGFloat)fontSize{
//
//    UIFont *newFont = nil;
//    if (IS_IPHONE_5 || IS_IPHONE_4){
//        newFont = [UIFont adjustFont:fontSize - IPHONE5_INCREMENT];
//    }else if (IS_IPHONE_6_PLUS){
//        newFont = [UIFont adjustFont:fontSize + IPHONE6PLUS_INCREMENT];
//    }else{
//        newFont = [UIFont adjustFont:fontSize];
//    }
//    return newFont;
//}

/*
 *
 注意：此方法只能替换 纯代码 写的控件字号，如果你用xib创建的控件且在xib里面设置的字号，那么替换不了！你需要在xib的
 awakeFromNib方法里面手动设置下控件字体
*/

// ------------------------------ 用上面的方法即可 ------------------

/**
 *  字体适配 我在PCH文件定义了一个方法
 */
// 1、ios字体适配的、用宏定义适配字体大小（根据手机机型判断）
// 宏定义
//#define FONT_SIZE(size) ([UIFont systemFontOfSize:FontSize(size))
//static inline CGFloat FontSize(CGFloat fontSize){
//    if ([UIScreen cz_screenWidth] == 320) {
//        return fontSize-2;
//    }else if ([UIScreen cz_screenWidth] == 375){
//        return fontSize;
//    }else{
//        return fontSize+2;
//    }
//}

// 2、ios字体适配的、用宏定义适配字体大小（根据手机机型判断）

//#define IOS_VERSION_10_OR_LATER (([[[UIDevice currentDevice]systemVersion]floatValue]>=10.0)? (YES):(NO))
//#define AdapationLabelFont(n) (IOS_VERSION_10_OR_LATER?((n-1)*([[UIScreen mainScreen]bounds].size.width/375.0f)):((n)*([[UIScreen mainScreen]bounds].size.width/375.0f)))

// 3、用宏定义适配字体大小（根据手机尺寸判断）
//#define IsIphone6P          SCREEN_WIDTH==414
//#define SizeScale           (IsIphone6P ? 1.5 : 1)
//#define kFontSize(value)    value*SizeScale
//#define kFont(value)        [UIFont systemFontOfSize:value*SizeScale]

@end
