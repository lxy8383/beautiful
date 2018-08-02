//
//  ViewController.m
//  SQLDataTest
//
//  Created by 刘晓勇 on 15/11/27.
//  Copyright © 2015年 刘晓勇. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

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
    SecondViewController *second = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:second animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
