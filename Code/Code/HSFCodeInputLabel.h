//
//  HSFCodeInpuLabel.h
//  Code
//
//  Created by hushuangfei on 17/3/26.
//  Copyright © 2017年 HSF_Organization. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSFCodeInputLabel : UILabel


/**
 每个 验证码／密码 偏移量
 例如：
 1－2－3
 1－－2－－3
 */
@property(nonatomic,assign)CGFloat codeWidthOffset;


/**
 设置每位（验证码 ／ 密码）的背景按钮的尺寸(注意本事的size)
 */
@property(nonatomic,assign)CGSize codeSize;

/**
 验证码或密码 的几位数
 */
@property (nonatomic, assign) NSInteger numberOfVertificationCode;

/**
 是否开启密码  NO->验证码   YES->密码
 */
@property (nonatomic, assign) bool secureTextEntry;

/**
 当 secureTextEntry 设置为 YES时，输入时，密文显示的图样式 （默认--小红点）
 */
@property(nonatomic,copy)NSString *secretCodeImgName;


/**
 验证码／密码 背景图(普通状态)
 */
@property(nonatomic,copy)NSString *codeBgImgNameNor;
/**
 验证码／密码 背景图(输入后状态)
 */
@property(nonatomic,copy)NSString *codeBgImgNameSel;
@end
