//
//  lhsAccountModel.h
//  iaccount
//
//  Created by tyrande on 7/1/13.
//  Copyright (c) 2013 alan. All rights reserved.
//

#import "lhsBaseModel.h"

@interface lhsAccountModel : lhsBaseModel {
    NSString *accountSite;
}

@property (nonatomic, retain) NSString* accountSite;

+ (void)create_table;
+ (id)create:(NSMutableArray*)aSiteArray;

- (void)linkAccountWithId:(NSString*)accId;
@end
