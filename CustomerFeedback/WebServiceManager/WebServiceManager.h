//
//  WebServiceManager.h
//  Pulse
//
//  Created by Tanaka on 11/29/16.
//  Copyright © 2016 Tanaka. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "AFNetworking.h"


typedef void (^CompletionBlock)(id obj);
typedef void (^ErrorBlock)(NSURLSessionDataTask *task, NSError *error);

@interface WebServiceManager : AFHTTPSessionManager

+(instancetype)sharedInstance;

// detect network status
+ (BOOL)connectedToNetwork;

-(void)sendGetRequest:(NSDictionary*)params completionHandler:(CompletionBlock)completgygyionBlock errorHandler:(ErrorBlock)errorBlock;



@end
