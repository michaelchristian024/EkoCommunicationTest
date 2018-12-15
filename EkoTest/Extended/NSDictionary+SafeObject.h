//
//  NSDictionary+SafeObject.h
//  EkoTest
//
//  Created by Michael Christian on 15/12/18.
//  Copyright © 2018 Michael Christian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (SafeObject)


/**
 Get object using dictionary

 @param key key string from dictionary
 @return object
 */
- (nullable id)safeObjectForKey:(nonnull NSString *)key;

@end

NS_ASSUME_NONNULL_END
