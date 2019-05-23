//
//  LDCUserDefaultWriteManager.m
//  LDCKvo
//
//  Created by issuser on 2019/5/23.
//  Copyright © 2019 peanut. All rights reserved.
//

#import "LDCUserDefaultWriteManager.h"
#import "LdcUserDefalutPlistManager.h"

@interface LDCUserDefaultWriteManager()

@property (nonatomic,strong,readwrite) LdcUserDefalutPlistManager * plistManager;

@end

@implementation LDCUserDefaultWriteManager

- (void)setLdcValue:(id)value forKey:(NSString *)key {
    [self.plistManager setLdcValue:value forKey:key];
}

- (void)removeLdcValueForKey:(NSString *)key {
    [self.plistManager removeLdcValueForKey:key];
}

- (void)resetLdcUserDefault {
    [self.plistManager resetLdcUserDefault];
}

- (void)modifiValue:(id)value forKey:(NSString *)key {
    [self.plistManager modifiValue:value ForKey:key];
}

#pragma mark ---- setter and getter

- (LdcUserDefalutPlistManager *)plistManager {
    if (_plistManager) {
        return _plistManager;
    }
    _plistManager = [[LdcUserDefalutPlistManager alloc] init];
    return _plistManager;
}

@end
