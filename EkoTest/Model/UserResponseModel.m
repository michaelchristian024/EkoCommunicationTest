//
//  UserResponseModel.m
//  EkoTest
//
//  Created by Michael Christian on 15/12/18.
//  Copyright © 2018 Michael Christian. All rights reserved.
//

#import "UserResponseModel.h"
#import "AFNetworking.h"
#import "NSDictionary+SafeObject.h"
#import "UserModel.h"

@implementation UserResponseModel

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype) initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    if (self) {
        NSMutableArray *tempUserArray = [NSMutableArray array];
        NSObject *receivedUserResponse = dict;
        if ([receivedUserResponse isKindOfClass:[NSArray class]]) {
            for (NSDictionary *item in (NSArray *)receivedUserResponse) {
                if ([item isKindOfClass:[NSDictionary class]]) {
                    UserModel *user = [UserModel modelObjectWithDictionary:item];
                    [tempUserArray addObject:user];
                }
            }
        }
        self.userArray = [tempUserArray copy];
    }
    
    return self;
}

+ (void)getUserAPI:(void (^ _Nonnull)(UserResponseModel * _Nonnull userResponse))success failureResponse:(void (^_Nonnull)(NSError * _Nonnull errorResponse))failure {

    NSURL *baseURL = [NSURL URLWithString:@"https://api.github.com/"];
    NSDictionary *parameters = @{@"format": @"json"};
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager GET:@"users" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success([UserResponseModel modelObjectWithDictionary:responseObject]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}
@end
