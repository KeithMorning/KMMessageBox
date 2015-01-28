//
//  KMPlaceholderTextView.h
//  KMMessageBox
//
//  Created by fengxi on 15-1-28.
//  Copyright (c) 2015年 KeithMorning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KMPlaceholderTextView : UITextView<UITextViewDelegate>
@property (nonatomic,strong) NSString *placeText;
@property (nonatomic,strong) UIColor *placeColor;
@property (nonatomic,assign) BOOL Textnil;//输入框是否为空
-(instancetype)initWithFrame:(CGRect)frame PlaceText:(NSString *)placeText PlaceColor:(UIColor *)placeColor;
-(void)TextViewSizeChange:(void(^)(CGSize))Textviewsize;
@end
