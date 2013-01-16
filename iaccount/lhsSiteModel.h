//
//  lhsSiteModel.h
//  iaccount
//
//  Created by tyrande on 6/1/13.
//  Copyright (c) 2013 alan. All rights reserved.
//

#import "lhsBaseModel.h"

@interface lhsSiteModel : lhsBaseModel {
    NSString *siteName;
    NSString *siteIcon;
    NSString *siteInfo;
    NSString *siteLink;
    
}

@property (nonatomic, retain) NSString* siteName;
@property (nonatomic, retain) NSString* siteIcon;
@property (nonatomic, retain) NSString* siteInfo;
@property (nonatomic, retain) NSString* siteLink;

+ (void)create_table;
+ (id)create:(NSMutableArray*)aSiteArray;

@end
