//
//  OCSObjectiveCViewController.m
//  OCShellApp
//
//  Created by 徐冰 on 2024/3/11.
//

#import "OCShellObjectiveCViewController.h"
#import "OCShellApp-Swift.h"

#import <SwiftMixObjectiveCModule/SMOSwiftMethodCaller.h>
@interface OCShellObjectiveCViewController ()

@end

@implementation OCShellObjectiveCViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.title = @"OC容器页";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self generateSwiftButton];
}

- (void)generateSwiftButton {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    // Do any additional setup after loading the view.
    
    NSArray <NSString *> *titles = @[@"工程内OC调用Swift方法",@"组件内OC调用Swift方法",@"组件间OC调用Swift方法"];
    [titles enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *swiftButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [swiftButton setTitle:titles[idx] forState:UIControlStateNormal];
        swiftButton.tag = 10000 + idx;
        [swiftButton addTarget:self action:@selector(logSwiftUtil:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:swiftButton];
        
        swiftButton.frame = CGRectMake(0,0,200,30);
        swiftButton.center = CGPointMake(screenWidth / 2,screenHeight / 2 - 100 + idx * 100);
    }];
}

- (void)logSwiftUtil:(UIButton *)button {
    if (button.tag == 10000) {
        [self logSwiftUtilInsideSameProject];
    } else if (button.tag == 10001) {
        [self logSwiftUtilInsideSamePod];
    } else if (button.tag == 10002) {
        [self logSwiftUtilBetweenPods];
    }
}

// 在壳工程内，OC调用Swift需要用到头文件XXX-Swift.h。对应配置位置在【Build Settings】->【Swift Compiler - General】->【Objective-C Generated Interface Header Name】。在OC工程内创建Swift文件时会自动生成此配置。
- (void)logSwiftUtilInsideSameProject {
    NSString *info = [NSString stringWithFormat:@"from %s",__FILE__];
    [OCShellSwiftUtils logClassMethod:info];
    OCShellSwiftUtils *utils = [OCShellSwiftUtils new];
    [utils logInstanceMethod:info];
}

// 在同一个pod内，OC调用Swift需要用到头文件XXX-Swift.h。对应配置位置在【Build Settings】->【Swift Compiler - General】->【Objective-C Generated Interface Header Name】。Cocoapods里有Swift文件时会自动生成此配置。
- (void)logSwiftUtilInsideSamePod {
    [SMOSwiftMethodCaller logSwiftUtilInsideSamePod];
    SMOSwiftMethodCaller *caller = [SMOSwiftMethodCaller new];
    [caller logSwiftUtilInsideSamePod];
}

- (void)logSwiftUtilBetweenPods {

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
