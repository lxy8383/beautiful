//
//  ThirdViewController.m
//  SQLDataTest
//
//  Created by 刘晓勇 on 15/11/27.
//  Copyright © 2015年 刘晓勇. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *sendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sendBtn.frame = CGRectMake(20, 64, 100, 40);
    [sendBtn addTarget:self action:@selector(doInAction:) forControlEvents:UIControlEventTouchUpInside];
    [sendBtn setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:sendBtn];
}

- (void)doInAction:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
