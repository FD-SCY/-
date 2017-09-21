//
//  ViewController.m
//  九宫格手势密码
//
//  Created by 石纯勇 on 16/5/6.
//  Copyright © 2016年 石纯勇. All rights reserved.
//

#import "ViewController.h"
#import "NineLockView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(0, 70, self.view.frame.size.width, 20)];
    lb.textAlignment = NSTextAlignmentCenter;
    NineLockView *lockView = [[NineLockView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/10, 100, self.view.frame.size.width-self.view.frame.size.width/5, self.view.frame.size.width-self.view.frame.size.width/5)];
    
//    [lockView setLockSuccess:^(NSString *psw) {
//        lb.text = [NSString stringWithFormat:@"psw: %@", psw];
//    }];
    lockView.lockSuccess = ^(NSString *psw){
        lb.text = [NSString stringWithFormat:@"psw: %@", psw];
    };
    [self.view addSubview:lb];
    [self.view addSubview:lockView];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
