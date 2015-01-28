//
//  KMMessagView.h
//  KMMessageBox
//
//  Created by fengxi on 15-1-28.
//  Copyright (c) 2015年 KeithMorning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KMMessagView : UIView<UITextViewDelegate>

@property (nonatomic,strong)UIButton *sendButton;
-(void)sendMessage:(void(^)(NSString *))inputText;
-(instancetype)initWithFrame:(CGRect)frame PlaceText:(NSString *)placeText PlaceColor:(UIColor *)placeColor;
@end
