//
//  ViewController.m
//  MBProgressHUD_LJ
//
//  Created by 杰刘 on 2017/8/11.
//  Copyright © 2017年 刘杰. All rights reserved.
//

#import "ViewController.h"

#import "MBProgressHUD+LJTools.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton * hudButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    hudButton.frame = CGRectMake(0, 0, 100, 40);
    hudButton.backgroundColor = [UIColor redColor];
    hudButton.center = self.view.center;
    [hudButton addTarget:self action:@selector(onclickHUD:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:hudButton];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)onclickHUD:(UIButton *)sender{


//    [MBProgressHUD showMessageTextOnly:@"我在地下面"];
    [MBProgressHUD showMessage:@"哈哈哈"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUD];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
