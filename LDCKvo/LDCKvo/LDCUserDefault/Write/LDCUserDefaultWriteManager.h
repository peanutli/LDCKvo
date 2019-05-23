//
//  LDCUserDefaultWriteManager.h
//  LDCKvo
//
//  Created by issuser on 2019/5/23.
//  Copyright © 2019 peanut. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LDCUserDefaultWriteManager : NSObject

- (void)setLdcValue:(id)value forKey:(NSString *)key;
- (void)removeLdcValueForKey:(NSString *)key;
- (void)resetLdcUserDefault;
- (void)modifiValue:(id)value forKey:(NSString*)key;
- (void)synchronsize;

@end

NS_ASSUME_NONNULL_END
