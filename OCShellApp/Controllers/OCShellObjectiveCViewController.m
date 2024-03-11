//
//  OCSObjectiveCViewController.m
//  OCShellApp
//
//  Created by 徐冰 on 2024/3/11.
//

#import "OCShellObjectiveCViewController.h"
#import "OCShellApp-Swift.h"
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
    
    UIButton *swiftButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [swiftButton setTitle:@"OC调用Swift方法" forState:UIControlStateNormal];
    [swiftButton addTarget:self action:@selector(logSwiftUtil) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:swiftButton];
    
    swiftButton.frame = CGRectMake(0,0,150,30);
    swiftButton.center = CGPointMake(screenWidth / 2,screenHeight / 2);
}

- (void)logSwiftUtil {
    NSString *info = [NSString stringWithFormat:@"from %s",__FILE__];
    [OCShellSwiftUtils logClassMethod:info];
    OCShellSwiftUtils *utils = [OCShellSwiftUtils new];
    [utils logInstanceMethod:info];
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
