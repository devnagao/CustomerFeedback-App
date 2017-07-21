//
//  WebServiceManager.m
//  Pulse
//
//  Created by Tanaka on 11/29/16.
//  Copyright © 2016 Tanaka. All rights reserved.
//

#import "WebServiceManager.h"
#include <netinet/in.h>

@implementation WebServiceManager

+(instancetype)sharedInstance
{
    static WebServiceManager *singleton;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        
        singleton = [[WebServiceManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://www.play-by-ear.net/feedback/serverAPI.php"]];
        
    });
    return singleton;
}

-(id)initWithBaseURL:(NSURL *)url
{
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"com.oil.pulse"];
    
    self = [super initWithBaseURL:url sessionConfiguration:sessionConfig];
    
    if (self) {
        
    }
    return self;
}



#pragma mark Internet Connection
+ (BOOL)connectedToNetwork
{
    // Create zero addy
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags)
    {
        printf("Error. Could not recover network reachability flags\n");
        return 0;
    }
    
    BOOL isReachable = flags & kSCNetworkFlagsReachable;
    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
    
    BOOL isconnected = (isReachable && !needsConnection) ? YES : NO;
    
    if (!isconnected) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Please check your internet connectivity." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:okAction];
        
        UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
        [window.rootViewController presentViewController:alertController animated:YES completion:nil];
        
    }
    
    return isconnected;
}

-(void)sendGetRequest:(NSDictionary *)params completionHandler:(CompletionBlock)completionBlock errorHandler:(ErrorBlock)errorBlock
{
    [self GET:@"" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completionBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(task, error);
    }];
}


@end
