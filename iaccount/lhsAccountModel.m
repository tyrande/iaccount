//
//  lhsAccountModel.m
//  iaccount
//
//  Created by tyrande on 7/1/13.
//  Copyright (c) 2013 alan. All rights reserved.
//

#import "lhsAccountModel.h"
#import "lhsAccountRelationModel.h"
#import "lhsAccountFieldRelationModel.h"

@implementation lhsAccountModel

@synthesize accountSite;

+ (int)columnNum {
    return 2;
}

+ (NSString*)tableName {
    return @"LHSACCOUNT";
}

+ (void)create_table {
    NSString *sqlStatement = @"CREATE TABLE IF NOT EXISTS LHSACCOUNT (ID INTEGER PRIMARY KEY AUTOINCREMENT, ACCSITEID INT, FOREIGN KEY(ACCSITEID) REFERENCES LHSSITE(ID))";
    [[lhsSqlite client] executeSql:sqlStatement];
}

+ (id)create:(NSMutableArray*)aSiteArray {
    lhsAccountModel *account = [[lhsAccountModel alloc] init];
    account.accountSite = aSiteArray[0];
    [account save];
    return account;
}

- (id)initWithArray:(NSMutableArray*)aSiteArray {
    self = [super init];
    if (self) {
        self.lhsID = aSiteArray[0];
        self.accountSite = aSiteArray[1];
    }
    return self;
}

- (void)addField:(NSString*)fieldKey fieldValue:(NSString*)fieldValue {
    [lhsAccountFieldRelationModel createWithAccountID:self.lhsID fieldKey:fieldKey fieldValue:fieldValue];
}

- (void)addAccountWithId:(NSString*)accId {
    [lhsAccountRelationModel createWithAccountID:self.lhsID accAccountID:accId];
}

- (void)save {
    if (!self.lhsID) {
        NSString *insertSql = [NSString stringWithFormat:@"INSERT INTO LHSACCOUNT (ACCSITEID) VALUES (\"%@\")", self.accountSite];
        self.lhsID = [[lhsSqlite client] insertWithSql:insertSql];
    }
}

- (void)update {
    
}

@end
