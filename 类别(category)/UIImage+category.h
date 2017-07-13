//
//  UIImage+category.h
//  类别(category)
//
//  Created by 马金丽 on 17/6/21.
//  Copyright © 2017年 majinli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (category)


/**
 添加文字水印

 @param image 要添加文字水印的图片
 @param text 要添加的水印文字
 @param point 添加的中心点
 @param attributeDict 水印的配置
 @return 新的图片
 */
+(UIImage *)addWatermark_withImage:(UIImage *)image with_text:(NSString *)text textPoint:(CGPoint)point attributedString:(NSDictionary *)attributeDict;


/**
 添加图片水印

 @param image 要添加图片水印的图片
 @param wateImage 要添加的水印
 @param imageRect 添加水印的位置
 @return 新的图片
 */
+(UIImage *)addPicWatermark_withImage:(UIImage *)image with_wateImage:(UIImage *)wateImage waterImageRect:(CGRect)imageRect;


/**
 裁剪圆形图片

 @param image 要裁剪的图片
 @param rect 位置
 @return 新的图片
 */
+(UIImage *)cutCircle_withImage:(UIImage *)image cirecleRect:(CGRect)rect;

//截屏
+ (void)pq_cutScreenWithView:(UIView *)view successBlock:(void(^)(UIImage * image,NSData * imagedata))block;


@end
