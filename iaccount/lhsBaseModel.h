//
//  lhsBaseModel.h
//  iaccount
//
//  Created by tyrande on 6/1/13.
//  Copyright (c) 2013 alan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "lhsSqlite.h"

@interface lhsBaseModel : NSObject {
    NSString *lhsID;
}

@property (nonatomic, retain) NSString* lhsID;

+ (void)dropTable;
+ (NSMutableArray *)all;
+ (id)find:(NSString*)alhsID;

@end
