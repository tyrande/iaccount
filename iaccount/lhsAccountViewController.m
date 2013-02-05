//
//  lhsAccountViewController.m
//  iaccount
//
//  Created by tyrande on 16/1/13.
//  Copyright (c) 2013 alan. All rights reserved.
//

#import "lhsAccountViewController.h"
#import "lhsAddAccountViewController.h"
#import "lhsAccountModel.h"

#import "NimbusModels.h"
#import "NimbusCore.h"

@interface lhsAccountViewController ()
@property (nonatomic, readwrite, retain) NITableViewModel* model;
@property (nonatomic, readwrite, retain) NITableViewActions* actions;
@end

@implementation lhsAccountViewController

@synthesize model = _model;
@synthesize actions = _actions;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(didTapAddButton:)];
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
    [self.tableView reloadData];
}

- (void)didTapAddButton:(id)sender {
    lhsAddAccountViewController *addAccountcontroller = [[lhsAddAccountViewController alloc] init];
    [self.navigationController pushViewController:addAccountcontroller animated:YES];
}
@end
