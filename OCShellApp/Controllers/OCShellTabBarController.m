//
//  OCSTabBarController.m
//  OCShellApp
//
//  Created by 徐冰 on 2024/3/11.
//

#import "OCShellTabBarController.h"
// 在壳工程内，OC调用Swift需要用到此头文件。对应配置位置在【Build Settings】->【Swift Compiler - General】->【Objective-C Generated Interface Header Name】。在OC工程内创建Swift文件时会自动生成此配置。
#import "OCShellApp-Swift.h"

#import "OCShellObjectiveCViewController.h"

@interface OCShellTabBarController ()

@end

@implementation OCShellTabBarController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.viewControllers = [self p_generateChildControllers];
        self.tabBar.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSArray <UIViewController *> *)p_generateChildControllers {
    OCShellObjectiveCViewController *vc1 = [OCShellObjectiveCViewController new];
    OCShellSwiftViewController *vc2 = [OCShellSwiftViewController new];
    return @[vc1,vc2];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
