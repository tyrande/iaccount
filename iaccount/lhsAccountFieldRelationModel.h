//
//  lhsAccountFieldRelationModel.h
//  iaccount
//
//  Created by tyrande on 8/1/13.
//  Copyright (c) 2013 alan. All rights reserved.
//

#import "lhsBaseModel.h"

@interface lhsAccountFieldRelationModel : lhsBaseModel {
    NSString *accountID;
    NSString *accountFieldID;
}

@property (nonatomic, retain) NSString* accountID;
@property (nonatomic, retain) NSString* accountFieldID;

+ (void)create_table;
+ (id)create:(NSMutableArray*)aSiteArray;
+ (id)createWithAccountID:(NSString*)accId
                 fieldKey:(NSString*)fieldKey
               fieldValue:(NSString*)fieldValue;
@end
