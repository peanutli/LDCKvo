//
//  LDCUserDefaultReadManager.h
//  LDCKvo
//
//  Created by issuser on 2019/5/23.
//  Copyright © 2019 peanut. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface LDCUserDefaultReadManager : NSObject

- (id)ldcValueForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
