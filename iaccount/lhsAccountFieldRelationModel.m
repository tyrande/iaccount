//
//  lhsAccountFieldRelationModel.m
//  iaccount
//
//  Created by tyrande on 8/1/13.
//  Copyright (c) 2013 alan. All rights reserved.
//

#import "lhsAccountFieldRelationModel.h"
#import "lhsAccountFieldModel.h"

@implementation lhsAccountFieldRelationModel

@synthesize accountID;
@synthesize accountFieldID;

+ (int)columnNum {
    return 3;
}

+ (NSString*)tableName {
    return @"LHSACCOUNTFIELDRELATION";
}

+ (void)create_table {
    NSString *sqlStatement = @"CREATE TABLE IF NOT EXISTS LHSACCOUNTFIELDRELATION (ID INTEGER PRIMARY KEY AUTOINCREMENT, ACCID INT, ACCFIELDID INT)";
    [[lhsSqlite client] executeSql:sqlStatement];
}

+ (id)create:(NSMutableArray*)aSiteArray {
    lhsAccountFieldRelationModel *accountRelation = [[lhsAccountFieldRelationModel alloc] init];
    accountRelation.accountID = aSiteArray[0];
    accountRelation.accountFieldID = aSiteArray[1];
    [accountRelation save];
    return accountRelation;
}

+ (id)createWithAccountID:(NSString*)accId
           fieldKey:(NSString*)fieldKey
         fieldValue:(NSString*)fieldValue {
    lhsAccountFieldModel *fieldModel = [lhsAccountFieldModel createWithKey:fieldKey fieldValue:fieldValue];
    lhsAccountFieldRelationModel *accountRelation = [[lhsAccountFieldRelationModel alloc] init];
    accountRelation.accountID = accId;
    accountRelation.accountFieldID = fieldModel.lhsID;
    [accountRelation save];
    return accountRelation;
}

- (id)initWithArray:(NSMutableArray*)aSiteArray {
    self = [super init];
    if (self) {
        self.lhsID = aSiteArray[0];
        self.accountID = aSiteArray[1];
        self.accountFieldID = aSiteArray[2];
    }
    return self;
}

- (void)save {
    if (!self.lhsID) {
        NSString *insertSql = [NSString stringWithFormat:@"INSERT INTO LHSACCOUNTFIELDRELATION (ACCID, ACCFIELDID) VALUES (\"%@\", \"%@\")", self.accountID, self.accountFieldID];
        self.lhsID = [[lhsSqlite client] insertWithSql:insertSql];
    }
}

- (void)update {
    
}


@end
