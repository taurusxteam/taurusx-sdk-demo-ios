//
//  BannerViewController.m
//  TaurusXDemo
//
//  Created by Don on 2024/8/31.
//

#import "BannerViewController.h"
@import TaurusxAdsSDK;

@interface BannerViewController () <TaurusXBannerDelegate>
@property(nonatomic, strong)  TaurusXBanner *banner;
@property (nonatomic, strong) UIView *bannerView;
@end

@implementation BannerViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    
    UIButton *loadButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 100, 350, 50)];
    [loadButton setTitle:@"Load Banner" forState:UIControlStateNormal];
    [loadButton setTitleColor:UIColor.systemBlueColor forState:UIControlStateNormal];
    [loadButton addTarget:self action:@selector(loadBanner) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loadButton];
    
    UIButton *closeButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 40, 80, 50)];
    [closeButton setTitle:@"Close" forState:UIControlStateNormal];
    [closeButton setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:closeButton];
}

- (void)loadBanner {
    self.banner = [[TaurusXBanner alloc] init];
    if (self.type==0) {
        self.banner.placementId = @"60001966";
        self.banner.adSize = TAX_BANNER_320_50;
    } else {
        self.banner.placementId = @"60001968";
        self.banner.adSize = TAX_MREC_300_250;
    }
    
    self.banner.delegate = self;
    [self.banner loadBanner];
}

- (void)close {
    [self dismissViewControllerAnimated:true completion:nil];
}


- (void)adLoadFinish:(UIView *)bannerView {
    NSLog(@"%s",__func__);
    
    self.bannerView = bannerView;
    [self.view addSubview:self.bannerView];
    self.bannerView.center = self.view.center;
}

- (void)adImpression {
    NSLog(@"%s",__func__);
}

- (void)adClicked {
    NSLog(@"%s",__func__);
}

- (void)adLoadFailWithError:(NSError *)error {
    NSLog(@"%s,%@",__func__,error);
}

@end
