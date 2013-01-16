//
//  lhsSiteModel.m
//  iaccount
//
//  Created by tyrande on 6/1/13.
//  Copyright (c) 2013 alan. All rights reserved.
//

#import "lhsSiteModel.h"

@implementation lhsSiteModel

@synthesize siteName;
@synthesize siteIcon;
@synthesize siteInfo;
@synthesize siteLink;

+ (int)columnNum {
    return 5;
}

+ (NSString*)tableName {
    return @"LHSSITE";
}

+ (void)create_table {
    NSString *sqlStatement = @"CREATE TABLE IF NOT EXISTS LHSSITE (ID INTEGER PRIMARY KEY AUTOINCREMENT, SITENAME TEXT, SITEICON TEXT, SITEINFO TEXT, SITELINK TEXT)";
    [[lhsSqlite client] executeSql:sqlStatement];
}

+ (id)create:(NSMutableArray*)aSiteArray {
    lhsSiteModel *site = [[lhsSiteModel alloc] init];
    site.siteName = aSiteArray[0];
    site.siteIcon = aSiteArray[1];
    site.siteInfo = aSiteArray[2];
    site.siteLink = aSiteArray[3];
    [site save];
    return site;
}

- (id)initWithArray:(NSMutableArray*)aSiteArray {
    self = [super init];
    if (self) {
        self.lhsID = aSiteArray[0];
        self.siteName = aSiteArray[1];
        self.siteIcon = aSiteArray[2];
        self.siteInfo = aSiteArray[3];
        self.siteLink = aSiteArray[4];
    }
    return self;
}

- (void)save {
    if (!self.lhsID) {
        NSString *insertSql = [NSString stringWithFormat:@"INSERT INTO LHSSITE (SITENAME, SITEICON, SITEINFO, SITELINK) VALUES (\"%@\", \"%@\", \"%@\", \"%@\")", self.siteName, self.siteIcon, self.siteInfo, self.siteLink];
        self.lhsID = [[lhsSqlite client] insertWithSql:insertSql];
    }
}

- (void)update {
    
}
@end
