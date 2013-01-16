//
//  lhsBaseModel.m
//  iaccount
//
//  Created by tyrande on 6/1/13.
//  Copyright (c) 2013 alan. All rights reserved.
//

#import "lhsBaseModel.h"

@implementation lhsBaseModel

@synthesize lhsID;

+ (int)columnNum {
    return 0;
}

+ (NSString*)tableName {
    return @"";
}

+ (void)dropTable {
    NSString *sqlStatement = [NSString stringWithFormat:@"DROP  TABLE  IF  EXISTS %@", [self tableName]];
    [[lhsSqlite client] executeSql:sqlStatement];
}

+ (NSMutableArray *)all {
    NSMutableArray *res = [[lhsSqlite client] selectAll:[self tableName] columnNum:[self columnNum]];
    NSMutableArray *modelArray = [NSMutableArray array];
    for (int i=0; i < [res count]; ++i) {
        [modelArray addObject:[[self alloc] initWithArray:res[i]]];
    }
    return modelArray;
}

+ (id)find:(NSString*)alhsID {
    return [[self alloc] initWithArray:[[lhsSqlite client] selectOne:[self tableName] columnNum:[self columnNum] lhsID:alhsID]];
}

@end
