//
//  LDCUserDefault.h
//  LDCKvo
//
//  Created by issuser on 2019/5/23.
//  Copyright © 2019 peanut. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LDCUserDefault : NSObject

@property (nonatomic,strong,readonly) LDCUserDefault * standUserDefault;

- (void)setLdcValue:(id)value forKey:(NSString *)key;
- (id)ldcValueForKey:(NSString *)key;

- (void)removeLdcValueForKey:(NSString *)key;
- (void)resetLdcUserDefault;
- (void)synchronsize;

@end

NS_ASSUME_NONNULL_END
