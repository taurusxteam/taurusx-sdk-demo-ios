//
//  IntersTitialViewController.m
//  TaurusXDemo
//
//  Created by Don on 2024/9/9.
//

#import "IntersTitialViewController.h"
@import TaurusxAdsSDK;

@interface IntersTitialViewController () <TaurusXInterstitialDelegate>
@property (nonatomic,strong) TaurusXInterstitial *inter;
@end

@implementation IntersTitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;

    UIButton *loadButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 100, 350, 50)];
    [loadButton setTitle:@"Load Inters" forState:UIControlStateNormal];
    [loadButton setTitleColor:UIColor.systemBlueColor forState:UIControlStateNormal];
    [loadButton addTarget:self action:@selector(load) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loadButton];
    
    UIButton *closeButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 40, 80, 50)];
    [closeButton setTitle:@"Close" forState:UIControlStateNormal];
    [closeButton setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:closeButton];
    
}

- (void)load {
    self.inter = [[TaurusXInterstitial alloc] init];
    self.inter.placementId = @"60001957";
    
    self.inter.delegate = self;
    [self.inter loadInterstitial];
}


- (void)show {
    if (self.inter.isReady) {
        [self.inter showAdFromRootViewController:self];
    }
}

- (void)close {
    [self dismissViewControllerAnimated:true completion:nil];
}


#pragma mark - TaurusXNativeDelegate

- (void)adLoadFinish {
    NSLog(@"%s",__func__);
    UIButton *showButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 160, 350, 50)];
    [showButton setTitle:@"Show Inters" forState:UIControlStateNormal];
    [showButton setTitleColor:UIColor.systemBlueColor forState:UIControlStateNormal];
    [showButton addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showButton];
}

- (void)adLoadFailWithError:(NSError *)error {
    NSLog(@"%s,%@",__func__,error);
}

- (void)adImpression {
    NSLog(@"%s",__func__);
}

- (void)adShowFailWithError:(NSError *)error {
    NSLog(@"%s,%@",__func__,error);
}

- (void)adClicked {
    NSLog(@"%s",__func__);
}

- (void)adDismissed {
    NSLog(@"%s",__func__);
}

@end
