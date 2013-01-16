//
//  lhsAddSiteViewController.m
//  iaccount
//
//  Created by tyrande on 7/1/13.
//  Copyright (c) 2013 alan. All rights reserved.
//

#import "lhsAddSiteViewController.h"

#import "NimbusModels.h"
#import "NimbusCore.h"

#import "lhsSiteModel.h"

@interface lhsAddSiteViewController ()
@property (nonatomic, readwrite, retain) NITableViewModel* model;
@property (nonatomic, readwrite, retain) NITextInputFormElement *nameInputElement;
@property (nonatomic, readwrite, retain) NITextInputFormElement *iconInputElement;
@property (nonatomic, readwrite, retain) NITextInputFormElement *infoInputElement;
@property (nonatomic, readwrite, retain) NITextInputFormElement *linkInputElement;
@end

@implementation lhsAddSiteViewController

@synthesize model = _modal;
@synthesize nameInputElement;
@synthesize iconInputElement;
@synthesize infoInputElement;
@synthesize linkInputElement;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        NSMutableArray* tableContents = [NSMutableArray array];
        [tableContents addObject:@"Name"];
        self.nameInputElement = [NITextInputFormElement textInputElementWithID:0 placeholderText:@"Site Name" value:@""];
        [tableContents addObject:nameInputElement];
        
        [tableContents addObject:@"Icon"];
        self.iconInputElement = [NITextInputFormElement textInputElementWithID:0 placeholderText:@"Site Icon" value:@""];
        [tableContents addObject:iconInputElement];
        
        [tableContents addObject:@"info"];
        self.infoInputElement = [NITextInputFormElement textInputElementWithID:0 placeholderText:@"Site Info" value:@""];
        [tableContents addObject:infoInputElement];
        
        [tableContents addObject:@"Link"];
        self.linkInputElement = [NITextInputFormElement textInputElementWithID:0 placeholderText:@"Site Link" value:@""];
        [tableContents addObject:linkInputElement];
        self.model = [[NITableViewModel alloc] initWithSectionedArray:tableContents delegate:(id)[NICellFactory class]];
        self.tableView.dataSource = self.model;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Go" style:UIBarButtonItemStyleBordered target:self action:@selector(createSite:)];
    [self.tableView reloadData];
}

- (void)createSite:(id)sender {
    NSMutableArray *newColumn = [NSMutableArray array];
    [newColumn addObject:self.nameInputElement.value];
    [newColumn addObject:self.iconInputElement.value];
    [newColumn addObject:self.infoInputElement.value];
    [newColumn addObject:self.linkInputElement.value];
    [lhsSiteModel create:newColumn];
}

@end
