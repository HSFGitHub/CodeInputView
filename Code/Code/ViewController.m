//
//  ViewController.m
//  Code
//
//  Created by hushuangfei on 17/3/25.
//  Copyright © 2017年 HSF_Organization. All rights reserved.
//

#import "ViewController.h"
#import "HSFCodeInputView.h"
@interface ViewController ()<HSFCodeInputViewDelegate>



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];

    //每位 验证码／密码 位置信息
    CGFloat codeBgWH = 60;
    CGFloat codeBgPadding = 10;
    //验证码个数
    NSInteger numberOfVertificationCode = 4;
    
    //验证View大小
    CGFloat inputViewWidth = codeBgWH * 4 + codeBgPadding *3;
    CGFloat inputViewHeight = codeBgWH;
    
    
    HSFCodeInputView *inputView = [[HSFCodeInputView alloc]initWithFrame:CGRectMake(10, 200, inputViewWidth, inputViewHeight)];
    inputView.delegate = self;
    inputView.numberOfVertificationCode = numberOfVertificationCode;
    
    //是否密码模式
    inputView.secureTextEntry = YES;
    [self.view addSubview:inputView];
}

#pragma mark - HSFCodeInputViewDelegate
-(void)codeInputView:(HSFCodeInputView *)inputView code:(NSString *)code{
    
    NSLog(@"  -----   验证码或者密码是  %@",code);
    
}


#pragma mark - Touches
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
