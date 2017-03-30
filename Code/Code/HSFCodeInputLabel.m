//
//  HSFCodeInpuLabel.m
//  Code
//
//  Created by hushuangfei on 17/3/26.
//  Copyright © 2017年 HSF_Organization. All rights reserved.
//

#import "HSFCodeInputLabel.h"

@implementation HSFCodeInputLabel
//重写setText方法，调用drawRect方法
-(void)setText:(NSString *)text{
    [super setText:text];
    [self setNeedsDisplay];
}


-(void)drawRect:(CGRect)rect{
    
    CGFloat codeOffset = self.codeWidthOffset < 0 ? 0 : self.codeWidthOffset;
    CGFloat rect_width = (rect.size.width - codeOffset) /self.numberOfVertificationCode;
    CGFloat rect_height = rect.size.height;
    
    CGFloat width = self.codeSize.width <=0 ?rect_width : self.codeSize.width;
    CGFloat height = self.codeSize.height <=0 ?rect_height:self.codeSize.height ;
    
    
    NSString *codeBgImgName = self.codeBgImgNameNor ? self.codeBgImgNameNor: @"input_Number_White_nor";
    for (NSInteger i = 0; i < self.numberOfVertificationCode; i++) {
        //绘制区域
        CGFloat tempX = i * (width + codeOffset);
        CGRect tempRect = CGRectMake(tempX, 0, width, height);
        UIImage *dotImage = [UIImage imageNamed:codeBgImgName];
        [dotImage drawInRect:tempRect];
    }
    
    
    NSString *imageName = self.secretCodeImgName ? self.secretCodeImgName: @"sign_unNomal";
    NSString *codeBgImgNameSel = self.codeBgImgNameSel ? self.codeBgImgNameSel: @"input_Number_White_nor";
    //绘制验证码／密码
    for (NSInteger i = 0; i < self.text.length; i ++) {
        
        //绘制区域
        CGFloat tempX = i * (width + codeOffset);
        CGRect tempRect = CGRectMake(tempX, 0, width, height);
        
        //输入后状态
        UIImage *entermage = [UIImage imageNamed:codeBgImgNameSel];
        [entermage drawInRect:tempRect];
        
        
        //密码
        if (self.secureTextEntry) {
            UIImage *dotImage = [UIImage imageNamed:imageName];
            CGPoint drawStartPoint = CGPointMake(tempX + (width - dotImage.size.width) / 2.0, (tempRect.size.height - dotImage.size.height) / 2.0);
            [dotImage drawAtPoint:drawStartPoint];
        }else{
            //验证码
            NSString *charecterString = [NSString stringWithFormat:@"%c", [self.text characterAtIndex:i]];
            //设置属性
            NSMutableDictionary *attributes = [[NSMutableDictionary alloc] init];
            attributes[NSFontAttributeName] = self.font;
            attributes[NSForegroundColorAttributeName] = self.textColor;
            //计算Size
            CGSize characterSize = [charecterString sizeWithAttributes:attributes];
            CGPoint vertificationCodeDrawStartPoint = CGPointMake(tempX + (width - characterSize.width) / 2.0, (tempRect.size.height - characterSize.height) / 2.0);
            // 绘制验证码/密码
            [charecterString drawAtPoint:vertificationCodeDrawStartPoint withAttributes:attributes];
        }
        
    }
    
    
}

@end
