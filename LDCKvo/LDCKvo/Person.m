//
//  Person.m
//  LDCKvo
//
//  Created by issuser on 2019/5/7.
//  Copyright © 2019 peanut. All rights reserved.
//

#import "Person.h"

@implementation Person

- (Person * _Nonnull (^)(NSString * _Nonnull))study {
    return ^(NSString * name) {
        NSLog(@"学习:%@",name);
        return self;
    };
}

- (Person * _Nonnull (^)(void))toGetUp {  // 返回值是一个block 这个block是有返回值的 =========  返回值是一个函数 这个函数也是有返回值的
    return ^(){
        NSLog(@"起床");
        return self;
    };
}

- (Person * _Nonnull (^)(void))toBreakfast {
    return  ^(){
       NSLog(@"吃早餐");
        return self;
    };
    
}

- (Person * _Nonnull (^)(void))toHaveLunch {
    return  ^(){
        NSLog(@"吃午饭");
        return self;
    };
}

- (Person * _Nonnull (^)(void))toHaveDinner {
    return  ^(){
        NSLog(@"吃晚饭");
        return self;
    };
}

- (Person * _Nonnull (^)(void))toSleep {
    return  ^(){
        //集合可以去重么  集合可以去重，但是集合的存储是无序的
        NSSet * set = [[NSSet alloc]initWithObjects:@"1",@"2",@"3",@"4",@"2",@"2",@"3", nil];
        NSLog(@"====:%@",set);
         NSLog(@"去睡觉");
        return self;
    };
}

- (void)otherday {
    self.toGetUp()
    .toSleep();
}

- (void)studentDay {
    self.toGetUp()
    .toBreakfast()
    .study(@"语文")
    .toHaveLunch()
    .study(@"数学")
    .toHaveDinner()
    .study(@"英语")
    .toSleep();

}

@end
