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

- (Person * _Nonnull (^)())toGetUp {
    return ^(){
        NSLog(@"起床");
        return self;
    };
}

- (Person * _Nonnull (^)())toBreakfast {
    return  ^(){
       NSLog(@"吃早餐");
        return self;
    };
    
}

- (Person * _Nonnull (^)())toHaveLunch {
    return  ^(){
        NSLog(@"吃午饭");
        return self;
    };
}

- (Person * _Nonnull (^)())toHaveDinner {
    return  ^(){
        NSLog(@"吃晚饭");
        return self;
    };
}

- (Person * _Nonnull (^)())toSleep {
    return  ^(){
         NSLog(@"去睡觉");
        return self;
    };
}

@end
