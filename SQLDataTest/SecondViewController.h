//
//  SecondViewController.h
//  SQLDataTest
//
//  Created by 刘晓勇 on 15/11/27.
//  Copyright © 2015年 刘晓勇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThirdViewController.h"
#import "MemModel.h"
#import "FMDB.h"
#import "DataMent.h"
@interface SecondViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    UITableView *_tableView;
    
    

}
@property (strong, nonatomic) FMDatabase *db;
@property (strong, nonatomic) NSMutableArray *sourceArr;
@end
