//
//  UserResponseModel.h
//  EkoTest
//
//  Created by Michael Christian on 15/12/18.
//  Copyright © 2018 Michael Christian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserModel;

NS_ASSUME_NONNULL_BEGIN

@interface UserResponseModel : NSObject
@property (strong, nonatomic, nullable) NSArray<UserModel *> *userArray;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
+ (void)getUserAPI:(void (^ _Nonnull)(UserResponseModel * _Nonnull userResponse))success failureResponse:(void (^_Nonnull)(NSError * _Nonnull errorResponse))failure;
@end

NS_ASSUME_NONNULL_END
