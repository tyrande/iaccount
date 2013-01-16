//
//  lhsAccountRelationModel.m
//  iaccount
//
//  Created by tyrande on 7/1/13.
//  Copyright (c) 2013 alan. All rights reserved.
//

#import "lhsAccountRelationModel.h"

@implementation lhsAccountRelationModel

@synthesize accountID;
@synthesize accountAccountID;

+ (int)columnNum {
    return 3;
}

+ (NSString*)tableName {
    return @"LHSACCOUNTRELATION";
}

+ (void)create_table {
    NSString *sqlStatement = @"CREATE TABLE IF NOT EXISTS LHSACCOUNTRELATION (ID INTEGER PRIMARY KEY AUTOINCREMENT, ACCID INT, ACCACCID INT)";
    [[lhsSqlite client] executeSql:sqlStatement];
}

+ (id)create:(NSMutableArray*)aSiteArray {
    lhsAccountRelationModel *accountRelation = [[lhsAccountRelationModel alloc] init];
    accountRelation.accountID = aSiteArray[0];
    accountRelation.accountAccountID = aSiteArray[1];
    [accountRelation save];
    return accountRelation;
}

+ (id)createWithAccountID:(NSString*)accId accAccountID:(NSString*)accAccountID {
    lhsAccountRelationModel *accountRelation = [[lhsAccountRelationModel alloc] init];
    accountRelation.accountID = accId;
    accountRelation.accountAccountID = accAccountID;
    [accountRelation save];
    return accountRelation;
}

- (id)initWithArray:(NSMutableArray*)aSiteArray {
    self = [super init];
    if (self) {
        self.lhsID = aSiteArray[0];
        self.accountID = aSiteArray[1];
        self.accountAccountID = aSiteArray[2];
    }
    return self;
}

- (void)save {
    if (!self.lhsID) {
        NSString *insertSql = [NSString stringWithFormat:@"INSERT INTO LHSACCOUNTRELATION (ACCID, ACCACCID) VALUES (\"%@\", \"%@\")", self.accountID, self.accountAccountID];
        self.lhsID = [[lhsSqlite client] insertWithSql:insertSql];
    }
}

- (void)update {
    
}

@end
