//
//  LDCUserDefaultReadManager.m
//  LDCKvo
//
//  Created by issuser on 2019/5/23.
//  Copyright © 2019 peanut. All rights reserved.
//

#import "LDCUserDefaultReadManager.h"
#import "LdcUserDefalutPlistManager.h"

@interface LDCUserDefaultReadManager()

@property (nonatomic,strong) LdcUserDefalutPlistManager * plistManager;

@end

@implementation LDCUserDefaultReadManager

- (id)ldcValueForKey:(NSString *)key {
    return [self.plistManager ldcValueForKey:key];
}

#pragma mark --- setter and getter
- (LdcUserDefalutPlistManager *)plistManager {
    if (_plistManager) {
        return _plistManager;
    }
    _plistManager = [[LdcUserDefalutPlistManager alloc] init];
    return _plistManager;
}

@end
