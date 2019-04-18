//
//  NSObject+KVO.m
//  LDCKvo
//
//  Created by issuser on 2019/4/16.
//  Copyright © 2019 peanut. All rights reserved.
//

#import "NSObject+KVO.h"
#import <objc/runtime.h>
#import <objc/message.h>

NSString *const LdcKVOClassPrefix = @"LdcKVOClassPrefix_";

@interface LdcObserverInfo : NSObject

@property (nonatomic, weak) NSObject *observer;
@property (nonatomic, copy) NSString *key;
@property (nonatomic, copy) LdcObservingBlock block;

@end

@implementation LdcObserverInfo

@end

static NSString * setterForGetter(NSString *getter) {
    if (getter.length <= 0) {
        return nil;
    }
    
    NSString *firstLetter = [[getter substringToIndex:1] uppercaseString];
    NSString *remainingLetters = [getter substringFromIndex:1];
    
    NSString *setter = [NSString stringWithFormat:@"set%@%@:", firstLetter, remainingLetters];
    return setter;
}

static NSString * getterForSetter(NSString *setter) {
    if (setter.length <= 0 || ![setter hasPrefix:@"set"] || ![setter hasPrefix:@":"]) {
        return nil;
    }
    
    // remove 'set' at the begining and ':' at the end
    NSRange range = NSMakeRange(3, setter.length - 4);
    NSString *key = [setter substringWithRange:range];
    
    // lower case the first letter
    NSString *firstLetter = [[key substringToIndex:1] lowercaseString];
    key = [key stringByReplacingCharactersInRange:NSMakeRange(0, 1)
                                       withString:firstLetter];
    return key;
}



static Class kvo_class(id self,SEL _cmd) {
    return  class_getSuperclass(object_getClass(self));
}

static void kvo_setter(id self,SEL _cmd,id newValue) {
    NSString * setterName = NSStringFromSelector(_cmd);
    NSString * getterName = getterForSetter(setterName);
    if (!getterName) {
        NSString *reason = [NSString stringWithFormat:@"Object %@ does not have setter %@", self, setterName];
        @throw [NSException exceptionWithName:NSInvalidArgumentException
                                       reason:reason
                                     userInfo:nil];
        return;
    }
    id oldValue = [self valueForKey:getterName];
    
    struct objc_super superclazz = {
        .receiver = self,
        .super_class = class_getSuperclass(object_getClass(self))
    };
    
    
}



@implementation NSObject (KVO)

//添加监听者
- (void)LdcAddObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath block:(LdcObservingBlock)block {
    //判断setter方法是否存在  不存在，抛出异常
    SEL setterSelector = NSSelectorFromString(setterForGetter(keyPath));
    Method setterMethod =  class_getInstanceMethod([self class], setterSelector);
    if (!setterMethod) {
        //抛出异常
        NSString *reason = [NSString stringWithFormat:@"Object %@ does not have a setter for key %@", self, keyPath];
        @throw [NSException exceptionWithName:NSInvalidArgumentException
                                       reason:reason
                                     userInfo:nil];
        return;
    }
    //检查kvo-NSObject类，是否存在，存在继续，不存在，创建。
    Class clazz = object_getClass(self);
    NSString * clazzName = NSStringFromClass(clazz);
    
    //检查当前calss的名字是否是 包含LdcKVOClassPrefix前缀的 说明self的isa指针 已经指向了 一个新类 ，如果没有包含前缀，需要创建，进行改变isa指针的操作
    if (![clazzName hasPrefix:LdcKVOClassPrefix]) {
        clazz = [self makeKvoClassWithOriginalClassName:clazzName];
        object_setClass(self, clazz);
    }
    
    //检查setter方法是否已经重写过了 判断当前类是否已经重写了setter方法
    if (![self hasSelector:setterSelector]) {
        const char *types = method_getTypeEncoding(setterMethod);
        //添加setter方法
        class_addMethod(clazz, setterSelector, (IMP)kvo_setter, types);
    }
}


- (Class)makeKvoClassWithOriginalClassName:(NSString *)origianlClazzName {
    NSString * kvoClassName = [LdcKVOClassPrefix stringByAppendingString:origianlClazzName];
    Class classzz = NSClassFromString(kvoClassName);
    if (classzz) {
        return classzz;
    }
    
    //不存在，创建kvo-Class
    Class originalClazz = object_getClass(self);
    Class kvoClazz = objc_allocateClassPair(originalClazz, kvoClassName.UTF8String, 0);
    
    //添加方法
    Method clazzMethod = class_getInstanceMethod(originalClazz, @selector(class));
    const char * types = method_getTypeEncoding(clazzMethod);
    class_addMethod(kvoClazz, @selector(class), (IMP)kvo_class, types);
    
    
    objc_registerClassPair(kvoClazz);
    return classzz;
}

- (BOOL)hasSelector:(SEL)selector {
    Class clazz = object_getClass(self);
    unsigned int methodCount = 0;
    Method *methodList = class_copyMethodList(clazz, &methodCount);
    for (unsigned int i = 0; i < methodCount; i++){
        SEL thisSelector = method_getName(methodList[i]);
        if (thisSelector == selector) {
            free(methodList);
            return YES;
        }
    }
    free(methodList);
    return NO;
}

//删除监听者
- (void)LdcRemoveObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath {
    
}

@end
