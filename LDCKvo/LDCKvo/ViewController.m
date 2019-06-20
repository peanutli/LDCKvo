//
//  ViewController.m
//  LDCKvo
//
//  Created by issuser on 2019/4/16.
//  Copyright © 2019 peanut. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "LDCUserDefault.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
   //通过block实现函数链式编程
    Person * p = [[Person alloc] init];
    [p studentDay];
   // [p otherday];
    
    
    NSLog(@"===========================");
//    NSString * str = @"abc这是一个a测试数据😊😊";
    NSString * str = @"abcdge你好faafd";

    for (int i = 0 ; i < str.length; i++) {
        unichar ch = [str characterAtIndex:i];
        NSLog(@"%c",ch);
    }
//    NSRange  range;
//    NSLog(@"%ld",str.length);
//    for (int i = 0 ; i < str.length; i += range.length) {
//
//        range = [str rangeOfComposedCharacterSequenceAtIndex:i];
//        NSAttributedString * attStr = [[NSAttributedString alloc]initWithString:str];
//        NSAttributedString * subStr = [attStr attributedSubstringFromRange:range];
//        NSString * str1 = [subStr string];
//        NSLog(@"%@",str1);
//    }
    
 //   [NSUserDefaults standardUserDefaults];
    LDCUserDefault * userDefault = [[LDCUserDefault alloc]init].standUserDefault;
    
    [userDefault setLdcValue:@"123" forKey:@"hello"];
    
    //block 无法修改变量值
    
   __block int a = 10;
    typedef void (^Block)(void);
    Block block = ^(){
        NSLog(@"!!!!!!!!!%d",a);
    };
    a = 11;
    block();
    
}




@end
