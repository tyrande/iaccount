//
//  lhsSqlLite.m
//  iaccount
//
//  Created by tyrande on 6/1/13.
//  Copyright (c) 2013 alan. All rights reserved.
//

#import "lhsSqlite.h"

@implementation lhsSqlite

+ (lhsSqlite *)client {
    static lhsSqlite *client;
    @synchronized(self) {
        if (!client) {
            client = [[lhsSqlite alloc] init];
        }
        return client;
    }
}

- (id)init {
    self = [super init];
    if (self) {
        [self open];
    }
    return self;
}

- (void)drop {
    [[NSFileManager defaultManager] removeItemAtPath:[self path] error:nil];
}

//- (void)initDatabase {
//    bool databaseAlreadyExists = [[NSFileManager defaultManager] fileExistsAtPath:[self path]];
//    
//    if ([self open] && !databaseAlreadyExists) {
//        NSLog(@"Database don't exists");
//        NSString *sqlStatement = @"CREATE TABLE IF NOT EXISTS IHSSITE (ID INTEGER PRIMARY KEY AUTOINCREMENT, SITENAME TEXT, SITEICON TEXT, SITEINFO TEXT)";
//        [self executeSql:sqlStatement];
//    }
//}

- (BOOL)open {
    if (sqlite3_open([[self path] UTF8String], &databaseHandle) != SQLITE_OK) {
        NSLog(@"Sqlite open fail");
        return NO;
    }
    return YES;
}

- (NSString*)path {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *databasePath = [documentsDirectory stringByAppendingPathComponent:@"iaccount.db"];
    return databasePath;
}

- (BOOL)executeSql:(NSString*) sql {
//    NSLog(@"Exec: %@", sql);
    char *error;
    if (sqlite3_exec(databaseHandle, [sql UTF8String], NULL, NULL, &error) != SQLITE_OK) {
//        sqlite3_close(databaseHandle);
        NSLog(@"Error: %s", error);
        return NO;
    }
    return YES;
}

- (NSString*)insertWithSql:(NSString*) sql {
    if ([self executeSql:sql]) {
        return [NSString stringWithFormat:@"%lld", sqlite3_last_insert_rowid(databaseHandle)];
    }
    return @"0";
}
//- (void)insertData {
//    NSString *insertSql = [NSString stringWithFormat:@"INSERT INTO IHSSITE (SITENAME, SITEICON, SITEINFO) VALUES (\"%@\", \"%@\", \"%@\")", @"ibooloo", @"path", @"aaaaaaa"];
//    [self executeSql:insertSql];
//}
//
//- (void)getData {
//    NSString *queryStatement = [NSString stringWithFormat:@"SELECT * FROM IHSSITE"];
//    sqlite3_stmt *statement;
//    if (sqlite3_prepare_v2(databaseHandle, [queryStatement UTF8String], -1, &statement, NULL) == SQLITE_OK)
//    {
//        while (sqlite3_step(statement) == SQLITE_ROW) {
//            NSLog(@"0: %d", sqlite3_column_int(statement, 0));
//            NSLog(@"0: %s", sqlite3_column_text(statement, 1));
//            NSLog(@"0: %s", sqlite3_column_text(statement, 2));
//            NSLog(@"0: %s", sqlite3_column_text(statement, 3));
//        }
//        sqlite3_finalize(statement);
//    }
//}

- (NSMutableArray*)selectAll:(NSString*)tableName
                   columnNum:(int)columnNum {
    NSString *queryStatement = [NSString stringWithFormat:@"SELECT * FROM `%@`", tableName];
    sqlite3_stmt *statement;
    NSMutableArray *selectArray = [NSMutableArray array];
    if (sqlite3_prepare_v2(databaseHandle, [queryStatement UTF8String], -1, &statement, NULL) == SQLITE_OK)
    {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSMutableArray *columnArray = [NSMutableArray array];
//            [columnArray addObject:[NSString stringWithFormat:@"%d", sqlite3_column_int(statement, 0)]];
//            [columnArray addObject:[NSString stringWithFormat:@"%s", sqlite3_column_text(statement, 0)]];
            for (int i=0; i < columnNum; ++i) {
                [columnArray addObject:[NSString stringWithFormat:@"%s", (char *)sqlite3_column_text(statement, i)]];
            }
            [selectArray addObject:columnArray];
        }
        sqlite3_finalize(statement);
    }
    return selectArray;
}

- (NSMutableArray*)selectOne:(NSString*)tableName
                   columnNum:(int)columnNum
                   lhsID:(NSString*)lhsID {
    NSString *queryStatement = [NSString stringWithFormat:@"SELECT * FROM `%@` WHERE ID = `%@`", tableName, lhsID];
    sqlite3_stmt *statement;
    NSMutableArray *columnArray = [NSMutableArray array];
    if (sqlite3_prepare_v2(databaseHandle, [queryStatement UTF8String], -1, &statement, NULL) == SQLITE_OK)
    {
        while (sqlite3_step(statement) == SQLITE_ROW) {
//            [columnArray addObject:[NSString stringWithFormat:@"%d", sqlite3_column_int(statement, 0)]];
            for (int i=0; i < columnNum; ++i) {
                [columnArray addObject:[NSString stringWithFormat:@"%s", (char *)sqlite3_column_text(statement, i)]];
            }
        }
        sqlite3_finalize(statement);
    }
    return columnArray;
}

- (void)close {
    sqlite3_close(databaseHandle);
}

@end
