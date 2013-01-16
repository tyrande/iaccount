//
//  lhsAccountFieldModel.m
//  iaccount
//
//  Created by tyrande on 8/1/13.
//  Copyright (c) 2013 alan. All rights reserved.
//

#import "lhsAccountFieldModel.h"

@implementation lhsAccountFieldModel

@synthesize accountFieldKey;
@synthesize accountFieldValue;

+ (int)columnNum {
    return 3;
}

+ (NSString*)tableName {
    return @"LHSACCOUNTFIELD";
}

+ (void)create_table {
    NSString *sqlStatement = @"CREATE TABLE IF NOT EXISTS LHSACCOUNTFIELD (ID INTEGER PRIMARY KEY AUTOINCREMENT, ACCFIELDKEY TEXT, ACCFIELDVALUE TEXT)";
    [[lhsSqlite client] executeSql:sqlStatement];
}

+ (id)create:(NSMutableArray*)aSiteArray {
    lhsAccountFieldModel *accountField = [[lhsAccountFieldModel alloc] init];
    accountField.accountFieldKey = aSiteArray[0];
    accountField.accountFieldValue = aSiteArray[1];
    [accountField save];
    return accountField;
}

+ (id)createWithKey:(NSString*)fieldKey
         fieldValue:(NSString*)fieldValue {
    lhsAccountFieldModel *accountField = [[lhsAccountFieldModel alloc] init];
    accountField.accountFieldKey = fieldKey;
    accountField.accountFieldValue = fieldValue;
    [accountField save];
    return accountField;
}

- (id)initWithArray:(NSMutableArray*)aSiteArray {
    self = [super init];
    if (self) {
        self.lhsID = aSiteArray[0];
        self.accountFieldKey = aSiteArray[1];
        self.accountFieldValue = aSiteArray[2];
    }
    return self;
}

- (void)save {
    if (!self.lhsID) {
        NSString *insertSql = [NSString stringWithFormat:@"INSERT INTO LHSACCOUNTFIELD (ACCFIELDKEY, ACCFIELDVALUE) VALUES (\"%@\", \"%@\")", self.accountFieldKey, self.accountFieldValue];
        self.lhsID = [[lhsSqlite client] insertWithSql:insertSql];
    }
}

- (void)update {
    
}


@end
