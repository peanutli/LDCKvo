//
//  LdcUserDefalutPlistManager.m
//  LDCKvo
//
//  Created by issuser on 2019/5/23.
//  Copyright © 2019 peanut. All rights reserved.
//

#import "LdcUserDefalutPlistManager.h"

@interface LdcUserDefalutPlistManager()

@property (nonatomic,strong,readwrite) NSString * defaultPath;
@property (nonatomic,strong,readwrite) NSMutableDictionary * defaultDictionary;



@end

@implementation LdcUserDefalutPlistManager

#pragma mark --- method
//plist文件保存数据
- (void)saveDataPlist {
    [self.defaultDictionary writeToFile:self.defaultPath atomically:YES];
}

//获取对象路径
+ (NSString *)searchPathForDirectoriesInDomains {
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [pathArray objectAtIndex:0];
    return path;
}

//获取文件的完整路径
+ (NSString *)fullPathForDirectoriesInDomains {
    return  [[LdcUserDefalutPlistManager searchPathForDirectoriesInDomains] stringByAppendingString:@"LDCUserDefault.plist"];
}

//写入数据到plist文件
- (void)setLdcValue:(id)value forKey:(NSString *)key {
    [self.defaultDictionary setValue:value forKey:key];
    [self saveDataPlist];
}

//从plist文件删除数据
- (void)removeLdcValueForKey:(NSString *)key {
    [self.defaultDictionary removeObjectForKey:key];
    [self saveDataPlist];
}

//从plist文件读取数据
- (id)ldcValueForKey:(NSString *)key {
    return  self.defaultDictionary[key];
}
//修改plist文件中的数据
- (void)modifiValue:(id)value ForKey:(NSString *)key {
    [self setLdcValue:value forKey:key];
}

//清空plist里面的所有内容
- (void)resetLdcUserDefault {
    [self.defaultDictionary removeAllObjects];
    [self saveDataPlist];
}

//同步data到plist文件
- (void)synchronsize:(NSDictionary *)dataDic {
    [self.defaultDictionary setValuesForKeysWithDictionary:dataDic];
    [self saveDataPlist];
}

#pragma  mark --- setter and getter
- (NSString *)defaultPath {
    return [LdcUserDefalutPlistManager fullPathForDirectoriesInDomains];
}

- (NSMutableDictionary *)defaultDictionary {
    if (_defaultDictionary) {
        return _defaultDictionary;
    }
    _defaultDictionary = [[NSMutableDictionary alloc]initWithContentsOfFile:self.defaultPath];
    return _defaultDictionary;
}



@end
