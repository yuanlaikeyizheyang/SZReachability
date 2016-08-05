//
//  ViewController.m
//  SZReachbility
//
//  Created by sz on 16/8/5.
//  Copyright © 2016年 悠然Mac. All rights reserved.
//

#import "ViewController.h"
#import "SZReachability.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UILabel *showNet;

@property (nonatomic, strong) SZReachability *hostReachability;

@end

@implementation ViewController

NSString *reachabilityChangedNotification = @"NetWorkReachabilityChangeNotification";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChange:) name:reachabilityChangedNotification object:nil];
    
    NSString *remoteHostName = @"www.baidu.com";

    self.hostReachability = [SZReachability reachabilityWithHostName:remoteHostName];
    [self.hostReachability startNotifier];
}

-(void)reachabilityChange:(NSNotification *)notification
{
    SZReachability *reach = [notification object];
    NSParameterAssert([reach isKindOfClass:[SZReachability class]]);
    NetWorkStatus status = [reach currentReachabilityStatus];
    
    switch (status) {
        case NotReachable:
            
            NSLog(@"当前网络不可用");
            self.showNet.text = @"当前网络不可用";
            break;
        case ReachableWiFi:
            
            NSLog(@"当前是WiFi");
            self.showNet.text = @"当前是WiFi";
            break;
        case Reachable2G:
            
            NSLog(@"当前是2G网络");
            self.showNet.text = @"当前是2G网络";
            break;
        case Reachable3G:
            
            NSLog(@"当前是3G网络");
            self.showNet.text = @"当前是3G网络";
            break;
            
        case Reachable4G:
            
            NSLog(@"当前是4G网络");
            self.showNet.text = @"当前是4G网络";
            break;
        case ReachableUnKnow:
            
            NSLog(@"未知的网络来源");
            self.showNet.text = @"未知的网络来源";
            break;
            
        default:
            
            NSLog(@"未知的网络来源");
            self.showNet.text = @"未知的网络来源";
            break;
    }
    
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
