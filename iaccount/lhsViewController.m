//
//  lhsViewController.m
//  iaccount
//
//  Created by tyrande on 6/1/13.
//  Copyright (c) 2013 alan. All rights reserved.
//

#import "lhsViewController.h"
#import "lhsAddSiteViewController.h"
#import "lhsSiteModel.h"

#import "NimbusModels.h"
#import "NimbusCore.h"

@interface lhsViewController ()
@property (nonatomic, readwrite, retain) NITableViewModel* model;
@property (nonatomic, readwrite, retain) NITableViewActions* actions;
@end

@implementation lhsViewController

@synthesize model = _model;
@synthesize actions = _actions;

- (void)viewDidLoad {
    [super viewDidLoad];
//    [[lhsSqlLite client] insertData];
//    [[lhsSqlLite client] getData];
//    NSMutableArray *sites = [[lhsSqlLite client] selectAll:@"IHSSITE" columnNum:3];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(didTapAddButton:)];
    _actions = [[NITableViewActions alloc] initWithTarget:self];
    NSMutableArray* tableContents = [NSMutableArray array];
    NSMutableArray *sites = [lhsSiteModel all];
    for (lhsSiteModel *s in sites) {
        [tableContents addObject:[_actions attachToObject:[NISubtitleCellObject objectWithTitle:s.siteName subtitle:s.siteInfo]
                                          navigationBlock:^(id object, UIViewController* controller) {
                                              return NO;
                                          }]];
    }
    
    _model = [[NITableViewModel alloc] initWithListArray:tableContents delegate:(id)[NICellFactory class]];
    self.tableView.dataSource = self.model;
    self.tableView.delegate = [self.actions forwardingTo:self];
    [self.tableView reloadData];
//    [lhsSiteModel create_table];
}

- (void)didTapAddButton:(id)sender {
    lhsAddSiteViewController *addSitecontroller = [[lhsAddSiteViewController alloc] init];
    [self.navigationController pushViewController:addSitecontroller animated:YES];
}
@end
