# KMMessageBox
a small message box like weekr's, support close the keyboard,self size automatically change. The interface is written by block. 
#how to use
copy the KMCompent and images folder to your project,import the file `KMMessagView.h`

```objc
CGSize size=[UIScreen mainScreen].bounds.size;

CGRect boxFrame=CGRectMake(0,size.height, size.width, 45);

//initialize the messagebox give it a placeholder text and color
KMMessagView *messagebox=[[KMMessagView alloc]initWithFrame:boxFrame PlaceText:@"评论" PlaceColor:[UIColor lightGrayColor]];

[messagebox sendMessage:^(NSString *txt) {
        //do some thing here,txt is from the input UITextView
        NSLog(@"%@",txt);
    }];

```
