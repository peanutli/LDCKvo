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
    
    
    /**
     *通过block实现函数链式编程
     */
    
    Person * p = [[Person alloc] init];
    
    p.toGetUp()
        .toBreakfast()
            .study(@"语文")
                .toHaveLunch()
                    .study(@"数学")
                        .toHaveDinner()
                            .study(@"英语")
                                    .toSleep();

    
    
    // Do any additional setup after loading the view, typically from a nib.
}




@end
