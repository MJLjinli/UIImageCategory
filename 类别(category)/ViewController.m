//
//  ViewController.m
//  类别(category)
//
//  Created by 马金丽 on 17/6/21.
//  Copyright © 2017年 majinli. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+category.h"
#import "UIImageView+reflection.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *mainImageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 64, self.view.bounds.size.width-20*2, 200)];
    UIImage *image = [UIImage addWatermark_withImage:[UIImage imageNamed:@"mjl_dddd"] with_text:@"夏目友人帐" textPoint:CGPointMake(20, 20) attributedString:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:50.0],NSForegroundColorAttributeName:[UIColor redColor],NSBackgroundColorAttributeName:[UIColor greenColor]}];
    mainImageView.image = image;
    [mainImageView addReflection];
    [self.view addSubview:mainImageView];

    UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(mainImageView.frame)+10, self.view.bounds.size.width - 40, self.view.bounds.size.width - 40)];
//    UIImage *picImage = [UIImage addPicWatermark_withImage:[UIImage imageNamed:@"mjl_dddd"] with_wateImage:[UIImage imageNamed:@"mjl_dddd"] waterImageRect:CGRectMake(20, 20, 80, 80)];
//    imageView2.image = picImage;
//    imageView2.image = [UIImage imageNamed:@"mjl_dddd"];
    UIImage *circleImage = [UIImage cutCircle_withImage:[UIImage imageNamed:@"mjl_dddd"] cirecleRect:CGRectMake(0, 0, 300, 250)];
    imageView2.image = circleImage;
    [self.view addSubview:imageView2];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
