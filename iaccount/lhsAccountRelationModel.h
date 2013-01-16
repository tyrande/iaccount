//
//  lhsAccountRelationModel.h
//  iaccount
//
//  Created by tyrande on 7/1/13.
//  Copyright (c) 2013 alan. All rights reserved.
//

#import "lhsBaseModel.h"

@interface lhsAccountRelationModel : lhsBaseModel {
    NSString *accountID;
    NSString *accountAccountID;
}

@property (nonatomic, retain) NSString* accountID;
@property (nonatomic, retain) NSString* accountAccountID;

+ (void)create_table;
+ (id)create:(NSMutableArray*)aSiteArray;
+ (id)createWithAccountID:(NSString*)accId accAccountID:(NSString*)accAccountID;
@end
