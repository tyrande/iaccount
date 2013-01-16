//
//  lhsSqlLite.h
//  iaccount
//
//  Created by tyrande on 6/1/13.
//  Copyright (c) 2013 alan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface lhsSqlite : NSObject {
    sqlite3 *databaseHandle;
}

+(lhsSqlite *)client;

- (BOOL)executeSql:(NSString*) sql;
- (NSString*)insertWithSql:(NSString*) sql;
- (NSMutableArray*)selectAll:(NSString*)tableName
                   columnNum:(int)columnNum;
- (NSMutableArray*)selectOne:(NSString*)tableName
                   columnNum:(int)columnNum
                       lhsID:(NSString*)lhsID;
- (void)close;
@end
