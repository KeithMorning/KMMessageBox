//
//  KMMessagView.m
//  KMMessageBox
//
//  Created by fengxi on 15-1-28.
//  Copyright (c) 2015年 KeithMorning. All rights reserved.
//
#define K_right_padding 44.0
#import "KMMessagView.h"
#import "KMPlaceholderTextView.h"
@interface KMMessagView()
{
    CGFloat maxy;//goodmessagebox的最大y值
}
@property (nonatomic,strong)KMPlaceholderTextView *Inputview;
@property (nonatomic,copy)void(^sendText)(NSString *);
@end
@implementation KMMessagView
-(instancetype)initWithFrame:(CGRect)frame PlaceText:(NSString *)placeText PlaceColor:(UIColor *)placeColor{
    self=[super initWithFrame:frame];
    if (self) {
        //添加输入框
        CGRect textFrame=CGRectMake(10, 6,self.frame.size.width-K_right_padding, 33);
        _Inputview=[[KMPlaceholderTextView alloc]initWithFrame:textFrame PlaceText:placeText PlaceColor:placeColor];
        _Inputview.delegate=self;
        [_Inputview TextViewSizeChange:^(CGSize size) {
            [self TextViewDidChange:size];
            
        }];
        _Inputview.returnKeyType=UIReturnKeyDone;
        _Inputview.font=[UIFont systemFontOfSize:14.0];
        [self addSubview:_Inputview];
        //添加发送按钮
        CGRect buttonFram=CGRectMake(self.frame.size.width-K_right_padding+10, 6, 33, 33);
        _sendButton=[[UIButton alloc]initWithFrame:buttonFram];
        [_sendButton setBackgroundImage:[UIImage imageNamed:@"send_arrow_left@2x.png"] forState:UIControlStateNormal];
        [_sendButton addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_sendButton];
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillChangeFrameNotification object:nil];
        maxy=[UIScreen mainScreen].bounds.size.height;
        self.frame=CGRectMake(0, self.frame.origin.y-self.frame.size.height, self.frame.size.width, self.frame.size.height);//在底部显示
    }
    
    return self;
}
#pragma mark 处理来自输入框的大小
-(void)TextViewDidChange:(CGSize)size{
    self.frame=CGRectMake(0, self.frame.origin.y, self.frame.size.width,size.height+6*2);
    self.frame=CGRectMake(0,maxy-self.frame.size.height, self.frame.size.width, self.frame.size.height);
    _Inputview.frame=CGRectMake(10, 6, self.frame.size.width-K_right_padding, size.height);
    
    if (_Inputview.Textnil) {
        [_sendButton setBackgroundImage:[UIImage imageNamed:@"send_arrow_left@2x.png"] forState:UIControlStateNormal];
    }else{
        [_sendButton setBackgroundImage:[UIImage imageNamed:@"send_blue_arrow_left@2x.png"] forState:UIControlStateNormal];
    }
}
#pragma mark sendbutton发送
-(void)sendMessage:(void (^)(NSString * text))inputText{
    if (inputText) {
        self.sendText=inputText;
    }
}
-(void)buttonClick{
    if (_Inputview.Textnil) {
        return;
    }else{
        self.sendText(_Inputview.text);
    }
}
#pragma mark 处理键盘显示通知
-(void)keyboardWillShow:(NSNotification *)notification{
    NSDictionary *userInfo=[notification userInfo];
    NSTimeInterval boardAnimationDuration=[[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGRect frame=[[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
    [UIView animateWithDuration:boardAnimationDuration delay:0.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGFloat keyBoardY=frame.origin.y;
        CGFloat keyBoardHeigh=frame.size.height;
        maxy=[UIScreen mainScreen].bounds.size.height-keyBoardHeigh;
        CGRect frame=self.frame;
        frame.origin.y=keyBoardY-CGRectGetHeight(self.frame);
        self.frame=frame;
        
    } completion:^(BOOL finished) {
        nil;
    }];
}
#pragma mark 处理退出键盘
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqual:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}
@end
