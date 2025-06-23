//
//  InStreamViewController.m
//  TaurusXDemo
//
//  Created by Don on 2024/11/25.
//

#import "InStreamViewController.h"
@import TaurusxAdsSDK;

@interface InStreamViewController () <TaurusXInStreamDelegate>
@property (nonatomic,strong)TaurusXInStream *instream;
@property (nonatomic, strong) UIView *adContainerView;
@end

@implementation InStreamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    
    UIButton *loadButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 100, 350, 50)];
    [loadButton setTitle:@"Load Instream" forState:UIControlStateNormal];
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
    self.instream = [[TaurusXInStream alloc] init];
    self.instream.placementId = @"60001957";
    
    self.instream.delegate = self;
    [self.instream loadInStream];
}

- (void)show {
    if (self.instream.isReady) {
        // set ContainerView Frame
        CGFloat x = 0;
        CGFloat y = self.view.safeAreaInsets.top;
        CGFloat width = self.view.bounds.size.width;
        CGFloat height = self.view.bounds.size.height-y;
        
        self.adContainerView = [[UIView alloc]initWithFrame:CGRectMake(x, y, width, height)];
        self.adContainerView.backgroundColor = [UIColor systemBlueColor];
        [self.view addSubview:self.adContainerView];
        [self.instream showWithAdView:self.adContainerView];
        [self startPlay];
    }
}

- (void)startPlay {
    [self.instream start];
}

- (void)pausePlay {
    [self.instream pause];
}

- (void)resumePlay {
    [self.instream resume];
}


- (void)close {
    [self dismissViewControllerAnimated:true completion:nil];
}


#pragma mark - TaurusXInStreamDelegate


- (void)adLoadFinish {
    NSLog(@"%s",__func__);
    UIButton *showButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 160, 350, 50)];
    [showButton setTitle:@"Show Instream" forState:UIControlStateNormal];
    [showButton setTitleColor:UIColor.systemBlueColor forState:UIControlStateNormal];
    [showButton addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showButton];
}
- (void)adLoadFailWithError:(NSError *)error {
    NSLog(@"%s,%@",__func__,error);
}
- (void)adShowFailWithError:(NSError *)error {
    NSLog(@"%s,%@",__func__,error);
}
- (void)adClicked {
    NSLog(@"%s",__func__);
}
- (void)adSkiped {
    NSLog(@"%s",__func__);
    [self.adContainerView removeFromSuperview];
}
- (void)adPause {
    NSLog(@"%s",__func__);
}
- (void)adResume {
    NSLog(@"%s",__func__);
}
- (void)adTapped {
    NSLog(@"%s",__func__);
}
- (void)adStart {
    NSLog(@"%s",__func__);
}
- (void)adComplete {
    NSLog(@"%s",__func__);
    [self.adContainerView removeFromSuperview];
}
- (void)adImpression {
    NSLog(@"%s",__func__);
}
- (void)adInStreamCurrentTime:(NSTimeInterval)currentTime duration:(NSTimeInterval)duration {
    NSLog(@"%s",__func__);
}
- (void)adInStreamStartBuffering {
    NSLog(@"%s",__func__);
}
- (void)adInStreamPlaybackReady {
    NSLog(@"%s",__func__);
}
- (void)adInStreamDidBufferToMediaTime:(NSTimeInterval)mediaTime {
    NSLog(@"%s",__func__);
}
@end
