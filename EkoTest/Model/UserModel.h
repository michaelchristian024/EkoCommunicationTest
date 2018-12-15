//
//  UserModel.h
//  EkoTest
//
//  Created by Michael Christian on 15/12/18.
//  Copyright © 2018 Michael Christian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserModel : NSObject
@property (strong, nonatomic) NSString *login;
@property (strong, nonatomic) NSString *avatarUrl;
@property (strong, nonatomic) NSString *githubUrl;
@property (strong, nonatomic) NSString *accountType;
@property (assign, nonatomic) BOOL siteAdmin;
@property (strong, nonatomic) NSNumber *userId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype) initWithDictionary:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
