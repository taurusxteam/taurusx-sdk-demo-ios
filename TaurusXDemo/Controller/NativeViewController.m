//
//  NativeViewController.m
//  TaurusXDemo
//
//  Created by Don on 2024/9/6.
//

#import "NativeViewController.h"
@import TaurusxAdsSDK;

@interface NativeViewController () <TaurusXNativeDelegate>
@property (nonatomic,strong) TaurusXNative *native;
@property (nonatomic,strong) TaurusXNativeData *nativeData;
@end

@implementation NativeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    
    UIButton *loadButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 100, 350, 50)];
    [loadButton setTitle:@"Load Native" forState:UIControlStateNormal];
    [loadButton setTitleColor:UIColor.systemBlueColor forState:UIControlStateNormal];
    [loadButton addTarget:self action:@selector(loadNative) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loadButton];
    
    UIButton *closeButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 40, 80, 50)];
    [closeButton setTitle:@"Close" forState:UIControlStateNormal];
    [closeButton setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:closeButton];
}

- (void)loadNative {
    self.native = [[TaurusXNative alloc] init];
    self.native.placementId = @"60001970";
    self.native.templateType = self.type==0?1:2;
    self.native.delegate = self;
    
    [self.native loadNative];
}

- (void)close {
    [self dismissViewControllerAnimated:true completion:nil];
}

#pragma mark - TaurusXNativeDelegate

- (void)adLoadFinish:(TaurusXNativeData *)nativeData adView:(UIView * _Nullable)nativeView {
    NSLog(@"%s",__func__);
    
    self.nativeData = nativeData;
    //...
    //create nativeView by nativeData,then regist interaction
    //[self.view addSubview:self.nativeView];
    //[self.native registerViewForInteractionWithContainer:self.nativeView mediaView:self.nativeView.imageView iconView:self.nativeView.iconView clickableViews:@[self.nativeView.imageView,self.nativeView.ctaView]];
    //or use built-in template
    [self.view addSubview:nativeView];
    nativeView.center = self.view.center;
}

- (void)adLoadFailWithError:(NSError *)error {
    NSLog(@"%s,%@",__func__,error);
}

- (void)adImpression {
    NSLog(@"%s",__func__);
}

- (void)adShowFailWithError:(NSError *)error {
    NSLog(@"%s",__func__);
}

- (void)adClicked {
    NSLog(@"%s",__func__);
}




@end
