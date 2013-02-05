//
//  lhsAddAccountViewController.m
//  iaccount
//
//  Created by tyrande on 16/1/13.
//  Copyright (c) 2013 alan. All rights reserved.
//

#import "lhsAddAccountViewController.h"
#import "lhsAccountModel.h"
#import "lhsAccountFieldModel.h"
#import "lhsAccountFieldRelationModel.h"
#import "lhsAccountRelationModel.h"

#import "NimbusModels.h"
#import "NimbusCore.h"

@interface lhsAddAccountViewController ()
@property (nonatomic, readwrite, retain) NITableViewModel* model;
@property (nonatomic, readwrite, retain) NITableViewActions* actions;
@end

@implementation lhsAddAccountViewController

@synthesize model = _model;
@synthesize actions = _actions;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [super viewDidLoad];

    _actions = [[NITableViewActions alloc] initWithTarget:self];
    NSMutableArray* tableContents = [NSMutableArray array];
    NSMutableArray *accounts = [lhsAccountModel all];
    for (lhsAccountModel *m in accounts) {
        [tableContents addObject:[_actions attachToObject:[NISubtitleCellObject objectWithTitle:m.lhsID subtitle:m.accountSite]
                                          navigationBlock:^(id object, UIViewController* controller) {
                                              return NO;
                                          }]];
    }
    
    _model = [[NITableViewModel alloc] initWithListArray:tableContents delegate:(id)[NICellFactory class]];
    self.tableView.dataSource = self.model;
    self.tableView.delegate = [self.actions forwardingTo:self];
    [self.tableView reloadData];}

@end
