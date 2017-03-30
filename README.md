# CodeInputView
密码框
1.使用方式：
    //每位 验证码／密码 位置信息
    CGFloat codeBgWH = 60;
    CGFloat codeBgPadding = 10;
    //验证码个数
    NSInteger numberOfVertificationCode = 4;
    
    //验证View大小
    CGFloat inputViewWidth = codeBgWH * 4 + codeBgPadding *3;
    CGFloat inputViewHeight = codeBgWH;
    
    
    HSFCodeInputView *inputView = [[HSFCodeInputView alloc]initWithFrame:CGRectMake(10, 200, inputViewWidth, inputViewHeight)];
   
    inputView.numberOfVertificationCode = numberOfVertificationCode;
    
    //是否密码模式
    //inputView.secureTextEntry = YES;
    [self.view addSubview:inputView];
    
    ／＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊／
    
    2.如何拿到如何的数据呢？
    当输入到最后一位时。可以通过代理拿到输入的数据。
    例如：
    //（1）.引入 <HSFCodeInputViewDelegate> 代理
    @interface ViewController ()<HSFCodeInputViewDelegate>
    @end
    
    //（2）创建View,并设置代理
     HSFCodeInputView *inputView = [[HSFCodeInputView alloc]initWithFrame:CGRectMake(10, 200, inputViewWidth, inputViewHeight)];
     //设置代理
     inputView.delegate = self;
     [self.view addSubview:inputView];
     
     //(3)//代理方法回调，拿到数据
    -(void)codeInputView:(HSFCodeInputView *)inputView code:(NSString *)code{
    
    NSLog(@"  -----   验证码或者密码是  %@",code);
    
}
    
