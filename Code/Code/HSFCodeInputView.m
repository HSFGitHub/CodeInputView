//
//  HSFCodeInputView.m
//  Code
//
//  Created by hushuangfei on 17/3/26.
//  Copyright © 2017年 HSF_Organization. All rights reserved.
//

#import "HSFCodeInputView.h"
#import "HSFCodeInputLabel.h"

@interface HSFCodeInputView ()

/**
 获取输入键盘
 */
@property(nonatomic,weak)IBOutlet UITextField *textField;


/**
 背景图
 */
@property(nonatomic,weak)IBOutlet UIImageView *bgImageView;


/**
 验证码／密码Label
 */
@property(nonatomic,weak)IBOutlet HSFCodeInputLabel *label;

@end

@implementation HSFCodeInputView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self = [self initFromNibWithFrame:frame];
    }
    return self;
}

-(instancetype)init{
    if (self = [super init]) {
      self = [self initFromNibWithFrame:CGRectZero];
    }
    return self;
}

-(instancetype)initFromNibWithFrame:(CGRect)nibFrame{
    
    NSArray  *nibArray= [[NSBundle mainBundle]loadNibNamed:@"HSFCodeInputView" owner:nil options:nil];
    
    if (nibArray.count <= 0) {
        return nil;
    }
    
    HSFCodeInputView *inputView =[nibArray firstObject];
    
    if (inputView) {
        inputView.frame = nibFrame;
        return inputView;
    }else{
        return nil;
    }
}

-(void)awakeFromNib{
    [super awakeFromNib];
    
/************************初始值*************************/
    //几位密码
    self.numberOfVertificationCode = 4;
    //每个密码框的背景大小
    self.label.codeSize = CGSizeMake(60, 60);
    //每个密码框背景之间的间隙
    self.label.codeWidthOffset = 10;
    //密码位数
    self.label.numberOfVertificationCode = self.numberOfVertificationCode;
    self.label.secureTextEntry = self.secureTextEntry;
    self.label.font = self.textField.font;
    
    
    
    switch (self.type) {
        case HSFCodeInputViewType_Login:
            [self codeType_Login];
            break;
            
        case HSFCodeInputViewType_BindPhoneNum:
            [self codeType_BingPhoneNum];
            break;
            
        default:
            break;
    }
}

//登录相关UI变化
-(void)codeType_Login{
  
    self.label.textColor = [UIColor whiteColor];
    self.label.codeBgImgNameNor = @"input_Number_White_nor";
    self.label.codeBgImgNameSel = @"input_Number_White_sel";
}

//绑定相关UI变化
-(void)codeType_BingPhoneNum{
    
    self.label.textColor = [UIColor lightGrayColor];
    self.label.codeBgImgNameNor = @"input_Number_nor";
    self.label.codeBgImgNameSel = @"input_Number_sel";
    

}
#pragma mark - 代理
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.textField becomeFirstResponder];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    // 判断是不是“删除”字符
    if (string.length != 0) {// 不是“删除”字符
        // 判断验证码/密码的位数是否达到预定的位数
        if (textField.text.length < self.numberOfVertificationCode) {
            self.label.text = [textField.text stringByAppendingString:string];
            self.vertificationCode = self.label.text;
            
            if (textField.text.length == self.numberOfVertificationCode - 1) {
                if (self.delegate &&[self.delegate respondsToSelector:@selector(codeInputView:code:)]) {
                    [self.delegate codeInputView:self code:self.vertificationCode];
                }
            }
            
            return YES;
        } else {
            
            if (textField.text.length == self.numberOfVertificationCode) {
                if (self.delegate &&[self.delegate respondsToSelector:@selector(codeInputView:code:)]) {
                    [self.delegate codeInputView:self code:self.vertificationCode];
                }
            }
            
            return NO;
        }
    } else { // 是“删除”字符
        self.label.text = [textField.text substringToIndex:textField.text.length - 1];
        self.vertificationCode = self.label.text;
        return YES;
    }
}



#pragma mark - setter方法
-(void)setType:(HSFCodeInputViewType)type{
    _type = type;
    switch (self.type) {
        case HSFCodeInputViewType_Login:
            [self codeType_Login];
            break;
            
        case HSFCodeInputViewType_BindPhoneNum:
            [self codeType_BingPhoneNum];
            break;
            
        default:
            break;
    }
}
-(void)setBgImageName:(NSString *)bgImageName{
    _bgImageName = bgImageName;
    
    if (!bgImageName) {
        return;
    }
    
    self.bgImageView.image = [UIImage imageNamed:bgImageName];
}


-(void)setNumberOfVertificationCode:(NSInteger)numberOfVertificationCode{
    _numberOfVertificationCode = numberOfVertificationCode;
    self.label.numberOfVertificationCode = numberOfVertificationCode;
}


-(void)setSecretCodeImgName:(NSString *)secretCodeImgName{
    _secretCodeImgName = secretCodeImgName;
    self.label.secretCodeImgName = secretCodeImgName;
}

-(void)setSecureTextEntry:(bool)secureTextEntry{
    _secureTextEntry = secureTextEntry;
    self.label.secureTextEntry = secureTextEntry;
}

-(void)setCodeBgImgSize:(CGSize)codeBgImgSize{
    _codeBgImgSize = codeBgImgSize;
    self.label.codeSize = codeBgImgSize;
}

-(void)setCodeBgWidthOffset:(CGFloat)codeBgWidthOffset{
    _codeBgWidthOffset = codeBgWidthOffset;
    self.label.codeWidthOffset = codeBgWidthOffset;
}

@end
