//
//  ViewController.m
//  LDCKvo
//
//  Created by issuser on 2019/4/16.
//  Copyright © 2019 peanut. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

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
    NSString * str = @"这是一个测试数据😊😊";
    
//    for (int i = 0 ; i < str.length; i++) {
//        unichar ch = [str characterAtIndex:i];
//        NSLog(@"%c",ch);
//    }
    NSRange  range;
    NSLog(@"%ld",str.length);
    for (int i = 0 ; i < str.length; i += range.length) {
        
        range = [str rangeOfComposedCharacterSequenceAtIndex:i];
        NSAttributedString * attStr = [[NSAttributedString alloc]initWithString:str];
        NSAttributedString * subStr = [attStr attributedSubstringFromRange:range];
        NSString * str1 = [subStr string];
        NSLog(@"%@",str1);
    }
}




@end
