//
//  LDCUserDefaultWriteManager.m
//  LDCKvo
//
//  Created by issuser on 2019/5/23.
//  Copyright © 2019 peanut. All rights reserved.
//

#import "LDCUserDefaultWriteManager.h"
#import "LdcUserDefalutPlistManager.h"
#import "LDCUserDefaultCacheManager.h"

@interface LDCUserDefaultWriteManager()

@property (nonatomic,strong,readwrite) LdcUserDefalutPlistManager * plistManager;
@property (nonatomic,strong,readwrite) LDCUserDefaultCacheManager * cacheManager;

@end

@implementation LDCUserDefaultWriteManager

//- (void)setLdcValue:(id)value forKey:(NSString *)key {
//    [self.plistManager setLdcValue:value forKey:key];
//}
//
//- (void)removeLdcValueForKey:(NSString *)key {
//    [self.plistManager removeLdcValueForKey:key];
//}
//
//- (void)resetLdcUserDefault {
//    [self.plistManager resetLdcUserDefault];
//}
//
//- (void)modifiValue:(id)value forKey:(NSString *)key {
//    [self.plistManager modifiValue:value ForKey:key];
//}

- (void)setLdcValue:(id)value forKey:(NSString *)key {
    [self.cacheManager setLdcValue:value forKey:key];
}

- (void)removeLdcValueForKey:(NSString *)key {
    [self.cacheManager removeLdcValueForKey:key];
}

- (void)resetLdcUserDefault {
    [self.cacheManager resetLdcUserDefault];
}

- (void)modifiValue:(id)value forKey:(NSString *)key {
    [self.cacheManager modifiValue:value ForKey:key];
}

- (void)synchronsize {
    [self.cacheManager synchronsize];
}

#pragma mark ---- setter and getter

//- (LdcUserDefalutPlistManager *)plistManager {
//    if (_plistManager) {
//        return _plistManager;
//    }
//    _plistManager = [[LdcUserDefalutPlistManager alloc] init];
//    return _plistManager;
//}

- (LDCUserDefaultCacheManager *)cacheManager {
    if (_cacheManager) {
        return _cacheManager;
    }
    _cacheManager = [[LDCUserDefaultCacheManager alloc] init];
    return _cacheManager;
}



@end
