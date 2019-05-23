//
//  LDCUserDefaultCacheManager.m
//  LDCKvo
//
//  Created by issuser on 2019/5/23.
//  Copyright © 2019 peanut. All rights reserved.
//

#import "LDCUserDefaultCacheManager.h"
#import "LdcUserDefalutPlistManager.h"

@interface LDCUserDefaultCacheManager()

@property (nonatomic,strong,readwrite) NSMutableDictionary * dataDic;
@property (nonatomic,strong,readwrite) LdcUserDefalutPlistManager * plistManager;

@end

@implementation LDCUserDefaultCacheManager

//写入
- (void)setLdcValue:(id)value forKey:(NSString *)key{
    [self.dataDic setValue:value forKey:key];
}
//删除
- (void)removeLdcValueForKey:(NSString *)key{
    [self.dataDic removeObjectForKey:key];
}
//读取
- (id)ldcValueForKey:(NSString *)key{
    return [self.dataDic objectForKey:key];
}
//修改
- (void)modifiValue:(id)value ForKey:(NSString *)key{
    [self setLdcValue:value forKey:key];
}
//全部删除清空
- (void)resetLdcUserDefault{
    [self.dataDic removeAllObjects];
}

- (void)synchronsize {
    [self.plistManager synchronsize:self.dataDic];
}

#pragma mark ---- setter and getter
- (NSMutableDictionary *)dataDic {
    if (_dataDic) {
        return _dataDic;
    }
    _dataDic = [[NSMutableDictionary alloc] init];
    return _dataDic;
}

- (LdcUserDefalutPlistManager *)plistManager {
    if (_plistManager) {
        return _plistManager;
    }
    _plistManager = [[LdcUserDefalutPlistManager alloc] init];
    return _plistManager;
}


@end
