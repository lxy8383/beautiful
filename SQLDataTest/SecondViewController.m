//
//  SecondViewController.m
//  SQLDataTest
//
//  Created by 刘晓勇 on 15/11/27.
//  Copyright © 2015年 刘晓勇. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
//    _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
//    _tableView.dataSource = self;
//    _tableView.delegate = self;
//    [self.view addSubview:_tableView];
    
    self.sourceArr = [[NSMutableArray alloc]init];
//    [self getData];
    
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"删除数据" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(doDeleteModel:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(10, 100, 100, 40);
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    
    //创建表
    [self useFMDB];
    //插数据
    [self insertDb];
    
    [self selectDbFromCount:10];
}

- (void)doDeleteModel:(UIButton *)sender
{

    [self deleteDb];
}

- (void)getData
{
    MemModel *memModel = [[MemModel alloc]init];
    memModel.nameStr = @"liu ";
    memModel.phoneStr = @"12345";
    memModel.addressStr = @"asdfas";
    
    MemModel *memModel1 = [[MemModel alloc]init];
    memModel1.nameStr = @"xiu ";
    memModel1.phoneStr = @"12345";
    memModel1.addressStr = @"阿发的是sdfas";
    
    MemModel *memModel2 = [[MemModel alloc]init];
    memModel2.nameStr = @"l奥神队fu ";
    memModel2.phoneStr = @"12345";
    memModel2.addressStr = @"阿萨德发生地方";
    
    
    MemModel *memModel3 = [[MemModel alloc]init];
    memModel3.nameStr = @"l撒旦法 ";
    memModel3.phoneStr = @"12345";
    memModel3.addressStr = @"asdfas";
    
    MemModel *memModel4 = [[MemModel alloc]init];
    memModel4.nameStr = @"l发给 ";
    memModel4.phoneStr = @"12345";
    memModel4.addressStr = @"奥神队f";
    
    NSArray *arr = @[memModel,memModel1,memModel2,memModel3,memModel4];
    self.sourceArr = [NSMutableArray arrayWithArray:arr];
//    [_tableView reloadData];
    
    
   
    
}

- (void)useFMDB
{
    // 获取数据库文件的路劲
//    NSArray *doc = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *string = doc[0];
//    NSString *fileName=[string stringByAppendingPathComponent:@"student.sqlite"];
//    NSLog(@" -->> 文件名:%@",fileName);
//    
//    // 获得数据库
//    FMDatabase *db = [FMDatabase databaseWithPath:fileName];
//    if([db open]){
//        BOOL result=[db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_student (id integer PRIMARY KEY AUTOINCREMENT, name text NOT NULL, age integer NOT NULL);"];
//        if (result) {
//            NSLog(@"创表成功");
//        }else{
//            NSLog(@"创表失败");
//        }
//    }
//    [db close];
//
//    self.db = db;
    
    
    //建表
    [DataMent execCreateSql:@"t_student" andUserId:@"userId" andTime:@"time" andMessage:@"message" andAvatarURL:@"urlAvatar"];
}


- (void)insertDb
{

    
    for(int i = 0; i < 10;i++){
        
        NSString *nameStr = [NSString stringWithFormat:@"刘晓勇 %d",i];
        NSDictionary *dict = @{@"userId":nameStr,@"message":@"你好我叫汇合",@"time":@"20122323",@"urlAvatar":@"www.baidu.com"};
        [DataMent executeInsert:@"t_student" andDict:dict];
    }
   
}

- (void)deleteDb
{
    [DataMent executeDelete:@"t_student" andDict:nil];
}

// 获取20条
- (void)selectDbFromCount:(NSInteger )cout
{
    NSMutableArray *itemArr = [DataMent executeSelet:@"t_student" andLimit:20 andOffset:0];
    
    NSLog(@"%@",itemArr);
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sourceArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellString = @"cellString";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellString];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellString];
    }
    MemModel *model = self.sourceArr[indexPath.row];
    cell.textLabel.text = model.nameStr;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ThirdViewController *third = [[ThirdViewController alloc]init];
    [self.navigationController pushViewController:third animated:YES];
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
