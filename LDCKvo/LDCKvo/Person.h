//
//  Person.h
//  LDCKvo
//
//  Created by issuser on 2019/5/7.
//  Copyright © 2019 peanut. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

- (Person *(^)(NSString *))study;

- (Person *(^)())toGetUp;
- (Person *(^)())toBreakfast;
- (Person *(^)())toHaveLunch;
- (Person *(^)())toHaveDinner;
- (Person *(^)())toSleep;

@end

NS_ASSUME_NONNULL_END
