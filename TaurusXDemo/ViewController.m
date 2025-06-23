//
//  ViewController.m
//  TaurusXDemo
//
//  Created by Don on 2025/6/23.
//

#import "ViewController.h"
#import "BannerViewController.h"
#import "NativeViewController.h"
#import "IntersTitialViewController.h"
#import "RewardedViewController.h"
#import "SplashViewController.h"
#import "InStreamViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)btnClicked:(UIButton*)sender {
    switch (sender.tag) {
        case 1:
        case 2:
        {
            BannerViewController *bannerVC = [[BannerViewController alloc]init];
            bannerVC.type = sender.tag == 1?0:1;
            bannerVC.modalPresentationStyle = UIModalPresentationFullScreen;
            [self presentViewController:bannerVC animated:true completion:nil];
        }
            break;
        case 3:
        case 4:
        {
            NativeViewController *nativeVC = [[NativeViewController alloc]init];
            nativeVC.type = sender.tag == 3?0:1;
            nativeVC.modalPresentationStyle = UIModalPresentationFullScreen;
            [self presentViewController:nativeVC animated:true completion:nil];
        }
            break;
        case 5:
        {
            IntersTitialViewController *interVC = [[IntersTitialViewController alloc]init];
            interVC.modalPresentationStyle = UIModalPresentationFullScreen;
            [self presentViewController:interVC animated:true completion:nil];
        }
            break;
        case 6:
        {
            RewardedViewController *rewardVC = [[RewardedViewController alloc]init];
            rewardVC.modalPresentationStyle = UIModalPresentationFullScreen;
            [self presentViewController:rewardVC animated:true completion:nil];
        }
            break;
        case 7:
        {
            SplashViewController *testVC = [[SplashViewController alloc]init];
            testVC.modalPresentationStyle = UIModalPresentationFullScreen;
            [self presentViewController:testVC animated:true completion:nil];
        }
            break;
        case 8:
        {
            InStreamViewController *testVC = [[InStreamViewController alloc]init];
            testVC.modalPresentationStyle = UIModalPresentationFullScreen;
            [self presentViewController:testVC animated:true completion:nil];
        }
            break;
        default:
            break;
    }
    
}
@end
