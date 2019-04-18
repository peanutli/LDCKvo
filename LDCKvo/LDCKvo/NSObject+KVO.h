//
//  NSObject+KVO.h
//  LDCKvo
//
//  Created by issuser on 2019/4/16.
//  Copyright © 2019 peanut. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^LdcObservingBlock)(id observedObject,NSString * observerKey,id oldValue, id newValue);

@interface NSObject (KVO)

//添加监听者
- (void)LdcAddObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath block:(LdcObservingBlock)block;

//删除监听者
- (void)LdcRemoveObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath;

@end

