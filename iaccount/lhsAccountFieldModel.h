//
//  lhsAccountFieldModel.h
//  iaccount
//
//  Created by tyrande on 8/1/13.
//  Copyright (c) 2013 alan. All rights reserved.
//

#import "lhsBaseModel.h"

@interface lhsAccountFieldModel : lhsBaseModel {
    NSString *accountFieldKey;
    NSString *accountFieldValue;
}

@property (nonatomic, retain) NSString* accountFieldKey;
@property (nonatomic, retain) NSString* accountFieldValue;

+ (void)create_table;
+ (id)create:(NSMutableArray*)aSiteArray;
+ (id)createWithKey:(NSString*)fieldKey
         fieldValue:(NSString*)fieldValue;
@end
