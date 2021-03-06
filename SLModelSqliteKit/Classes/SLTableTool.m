
//
//  SLTableTool.m
//  SLSQLitePackage
//
//  Created by CoderSLZeng on 2017/10/19.
//  Copyright © 2017年 GitHub. All rights reserved.
//

#import "SLTableTool.h"
#import "SLModelTool.h"
#import "SLSqliteTool.h"

@implementation SLTableTool

+ (NSArray *)tableSortedColumnNames:(Class)cls uid:(NSString *)uid {
    
    NSString *tableName = [SLModelTool tableName:cls];
    
    // CREATE TABLE SLStu(age integer,stuNum integer,score real,name text, primary key(stuNum))
    
    NSString *queryCreateSqlStr = [NSString stringWithFormat:@"select sql from sqlite_master where type = 'table' and name = '%@'", tableName];
    
    
    NSMutableDictionary *dic = [SLSqliteTool querySql:queryCreateSqlStr uid:uid].firstObject;
    
    NSString *createTableSql = dic[@"sql"];
    if (createTableSql.length == 0) {
        return nil;
    }
    createTableSql = [createTableSql stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\""]];
    
    //    [[createTableSql stringByReplacingOccurrencesOfString:@"\"" withString:@"" options:(NSStringCompareOptions) range:<#(NSRange)#>]
    
    createTableSql = [createTableSql stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    createTableSql = [createTableSql stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    createTableSql = [createTableSql stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    
    // CREATE TABLE SLStu((stuNum))
    
    // 1. age integer,stuNum integer,score real,name text, primary key
//    CREATE TABLE "SLStu" ( \n
//                           "age2" integer,
//                           "stuNum" integer,
//                           "score" real,
//                           "name" text,
//                           PRIMARY KEY("stuNum")
//                           )

    
    NSString *nameTypeStr = [createTableSql componentsSeparatedByString:@"("][1];
    
    // age integer
    // stuNum integer
    // score real
    // name text
    // primary key
    NSArray *nameTypeArray = [nameTypeStr componentsSeparatedByString:@","];
    
    NSMutableArray *names = [NSMutableArray array];
    for (NSString *nameType in nameTypeArray) {
        
        if ([[nameType lowercaseString] containsString:@"primary"]) {
            continue;
        }
        NSString *nameType2 = [nameType stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@" "]];
        
        
        // age integer
        NSString *name = [nameType2 componentsSeparatedByString:@" "].firstObject;
        
        [names addObject:name];
        
        
    }
    
    
    [names sortUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
        return [obj1 compare:obj2];
    }];
    return names;
}

+ (BOOL)isTableExists:(Class)cls uid:(NSString *)uid {
    
    NSString *tableName = [SLModelTool tableName:cls];
    NSString *queryCreateSqlStr = [NSString stringWithFormat:@"select sql from sqlite_master where type = 'table' and name = '%@'", tableName];
    
    NSMutableArray *result = [SLSqliteTool querySql:queryCreateSqlStr uid:uid];
    
    return result.count > 0;
}

@end
