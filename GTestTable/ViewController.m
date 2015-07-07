//
//  ViewController.m
//  GTestTable
//
//  Created by __无邪_ on 15/7/7.
//  Copyright © 2015年 __无邪_. All rights reserved.
//

#import "ViewController.h"
#import "ArrayDataSource.h"
#import "BaseTableViewProtocol.h"

static NSString * const Identifier = @"PhotoCell";

@interface ViewController ()<TableViewCellDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ArrayDataSource *photosArrayDataSource;
@property (nonatomic, strong) BaseTableViewProtocol *protocol;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    NSArray *photos = @[@"asdfa",@"safd",@"adfs",@"safd",@"adfs",@"safd",@"adfs"];
    
//    TableViewCellConfigureBlock configureCell = ^(UITableViewCell *cell, NSString *photo) {
//        [cell.textLabel setText:photo];
//        [cell.textLabel setTextColor:[UIColor greenColor]];
//    };
//    self.photosArrayDataSource = [[ArrayDataSource alloc] initWithItems:photos
//                                                         cellIdentifier:Identifier
//                                                     configureCellBlock:configureCell];
//    self.tableView.dataSource = self.photosArrayDataSource;
//    [self.tableView setDelegate:self];
//
//
    TableViewCellConfigurate configure = ^(UITableViewCell *cell, NSString *entity, NSIndexPath *indexPath) {
        [cell.textLabel setText:entity];
        cell.textLabel.textColor = [UIColor redColor];
    };
    
    self.protocol = [[BaseTableViewProtocol alloc] initWithItems:photos cellIdentifier:Identifier cellConfigureBlock:configure];
    [self.protocol setDelegate:self];
    
    self.tableView.dataSource = self.protocol;
    self.tableView.delegate = self.protocol;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:Identifier];
}

- (BOOL)isCellEditable{
    return YES;
}

// Called after the user changes the selection.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",indexPath.row);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
