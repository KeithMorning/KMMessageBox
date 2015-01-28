//
//  ViewController.m
//  KMMessageBox
//
//  Created by fengxi on 15-1-28.
//  Copyright (c) 2015年 KeithMorning. All rights reserved.
//

#import "ViewController.h"
#import "KMMessagView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)loadView{
    [super loadView];
    CGSize size=[UIScreen mainScreen].bounds.size;
    CGRect boxFrame=CGRectMake(0,size.height, size.width, 45);
    KMMessagView *messagebox=[[KMMessagView alloc]initWithFrame:boxFrame PlaceText:@"评论" PlaceColor:[UIColor lightGrayColor]];
    [messagebox sendMessage:^(NSString *txt) {
        NSLog(@"%@",txt);
    }];
    [self.view addSubview:messagebox];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
