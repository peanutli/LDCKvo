//
//  LDCUserDefault.m
//  LDCKvo
//
//  Created by issuser on 2019/5/23.
//  Copyright © 2019 peanut. All rights reserved.
//

#import "LDCUserDefault.h"
#import "LDCUserDefaultWriteManager.h"
#import "LDCUserDefaultReadManager.h"

@interface LDCUserDefault()

@property (nonatomic,strong,readwrite)  LDCUserDefault * standUserDefault;
@property (nonatomic,strong,readwrite) LDCUserDefaultWriteManager * writeManager;
@property (nonatomic,strong,readwrite) LDCUserDefaultReadManager * readManager;


@end

@implementation LDCUserDefault



#pragma mark --- method
- (void)setLdcValue:(id)value forKey:(NSString *)key {
    [self.writeManager setLdcValue:value forKey:key];
}

- (id)ldcValueForKey:(NSString *)key {
    return [self.readManager ldcValueForKey:key];
}

- (void)removeLdcValueForKey:(NSString *)key {
    [self.writeManager removeLdcValueForKey:key];
}

- (void)resetLdcUserDefault {
    [self.writeManager resetLdcUserDefault];
}

- (void)synchronsize {
    [self.writeManager synchronsize];
}


#pragma mark --- setter and getter

- (LDCUserDefault *)standUserDefault {
    if (_standUserDefault) {
        return _standUserDefault;
    }
    _standUserDefault = [[LDCUserDefault alloc]init];
    return _standUserDefault;
}

- (LDCUserDefaultWriteManager *)writeManager {
    if (_writeManager) {
        return _writeManager;
    }
    _writeManager =  [[LDCUserDefaultWriteManager alloc] init];
    return _writeManager;
}

- (LDCUserDefaultReadManager *)readManager {
    if (_readManager) {
        return _readManager;
    }
    _readManager = [[LDCUserDefaultReadManager alloc] init];
    return _readManager;
}

@end
