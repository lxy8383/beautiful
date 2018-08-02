//
//  DataMent.h
//  SQLDataTest
//
//  Created by 刘晓勇 on 15/11/27.
//  Copyright © 2015年 刘晓勇. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "FMDB.h"


@interface DataMent : NSObject

/*1
 *
 */
+ (BOOL)execUpdataWithSQl:(NSString *)sqlStr;
/*
 * 2
 */

// 1,2 功能相同
+ (BOOL)execUpdata:(NSString *)nameStr andSQl:(NSString *)sqlStr;




/*
 * 创建表
 * 创建表的方法有得修改
 *
 */

+ (BOOL)execCreateSql:(NSString *)tableName
            andUserId:(NSString *)userId
              andTime:(NSString *)timeStr
           andMessage:(NSString *)message
         andAvatarURL:(NSString *)string;

/*
 * 刷新数据库
 * @parameter tableName 表名
 * @parameter value_map
 *
 */


+ (void)executeUpdate:(NSString *)tableName
              andDict:(NSDictionary *)value_map
          andCondDict:(NSDictionary *)condition_map;

/*
 * 插入数据
 * @parameter tableName 表名
 * @parameter dict 数据结构
 *
 */
+ (void)executeInsert:(NSString *)tableName
              andDict:(NSDictionary *)dict;



/*
 * 分页查询
 * @parameter tableName 表名
 * @parameter limit 查询多少条结果
 * @parameter offset 分的页数
 */
+ (NSMutableArray *)executeSelet:(NSString *)tableName
                        andLimit:(NSInteger)limit
                       andOffset:(NSInteger)offset;

/*
 * 删除数据
 * @parameter tableName 表明
 * @parameter dict 表参数
 *
 */
+ (BOOL)executeDelete:(NSString *)tableName
              andDict:(NSDictionary *)dict;

@end
