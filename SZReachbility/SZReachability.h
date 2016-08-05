//
//  SZReachbility.h
//  SZReachbility
//
//  Created by sz on 16/8/5.
//  Copyright © 2016年 悠然Mac. All rights reserved.
//

/*
 如果有更好  更方便  更实用的方式  请您告知我,  让我们一起学习  也让更多的人知道我们的想法和方式  谢谢  190197131   18697585727@163.com
 */

#import <Foundation/Foundation.h>

typedef enum : NSUInteger{

    NotReachable = 0,
    ReachableWiFi,
    Reachable2G,
    Reachable3G,
    Reachable4G,
    ReachableUnKnow
    
    
}NetWorkStatus;

/*!
 *  监听网络变化
 */

extern NSString *kNetWorkReachabilityChangeNotification;

@interface SZReachability : NSObject

/*!
 * Use to check the reachability of a given host name.
 */
+ (instancetype)reachabilityWithHostName:(NSString *)hostName;

/*!
 * Use to check the reachability of a given IP address.
 */
+ (instancetype)reachabilityWithAddress:(const struct sockaddr *)hostAddress;

/*!
 * Checks whether the default route is available. Should be used by applications that do not connect to a particular host.
 */
+ (instancetype)reachabilityForInternetConnection;


#pragma mark reachabilityForLocalWiFi
//reachabilityForLocalWiFi has been removed from the sample.  See ReadMe.md for more information.
//+ (instancetype)reachabilityForLocalWiFi;

/*!
 * Start listening for reachability notifications on the current run loop.
 */
- (BOOL)startNotifier;
- (void)stopNotifier;

- (NetWorkStatus)currentReachabilityStatus;

/*!
 * WWAN may be available, but not active until a connection has been established. WiFi may require a connection for VPN on Demand.
 */
- (BOOL)connectionRequired;


@end
