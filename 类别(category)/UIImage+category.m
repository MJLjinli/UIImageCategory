//
//  UIImage+category.m
//  类别(category)
//
//  Created by 马金丽 on 17/6/21.
//  Copyright © 2017年 majinli. All rights reserved.
//

#import "UIImage+category.h"
#import <UIKit/UIKit.h>
@implementation UIImage (category)


+(nullable UIImage *)addWatermark_withImage:(UIImage *)image with_text:(NSString *)text textPoint:(CGPoint)point attributedString:(NSDictionary *)attributeDict
{
    //开启上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    //绘制图片
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    //添加水印文字
    [text drawAtPoint:point withAttributes:attributeDict];
    //从上下文中获取新图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭图形上下文
    UIGraphicsEndImageContext();
    return newImage;
}


+ (UIImage *)addPicWatermark_withImage:(UIImage *)image with_wateImage:(UIImage *)wateImage waterImageRect:(CGRect)imageRect
{
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [wateImage drawInRect:imageRect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)cutCircle_withImage:(UIImage *)image cirecleRect:(CGRect)rect
{
    //1、开启上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    //2、设置裁剪区域
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:rect];
    [path addClip];
    
    //3、绘制图片
    [image drawAtPoint:CGPointZero];
    
    //4、获取新图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //5、关闭上下文
    UIGraphicsEndImageContext();
    
    //6、返回新图片
    return newImage;
}

+ (void)pq_cutScreenWithView:(UIView *)view successBlock:(void(^)(UIImage * image,NSData * imagedata))block{
    //1、开启上下文
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, 0.0);
    //2.获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //3.截屏
    [view.layer renderInContext:ctx];
    
    //4、获取新图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //5.转化成为Data
    //compressionQuality:表示压缩比 0 - 1的取值范围
    NSData * data = UIImageJPEGRepresentation(newImage, 1);
    //6、关闭上下文
    UIGraphicsEndImageContext();
    
    //7.回调
    block(newImage,data);
}
@end
