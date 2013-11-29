//
//  PiMenuViewController.m
//  Picourse
//
//  Created by BILLY HO on 10/31/13.
//  Copyright (c) 2013 BILLY HO. All rights reserved.
//

#import "PiMenuViewController.h"
#import "UIViewController+REFrostedViewController.h"
#import "PiSettingViewController.h"
#import "PiFeedbackViewController.h"
#import "PiFavouriteViewController.h"


@interface PiMenuViewController ()

@end

@implementation PiMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.separatorColor = [UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:1.0f];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.opaque = NO;
    self.tableView.backgroundColor = [UIColor clearColor];
    
	self.tableView.tableHeaderView = (
	{
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 184.0f)];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, 100, 100)];
        imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        imageView.image = [UIImage imageNamed:@"avatar.png"];
        imageView.layer.masksToBounds = YES;
        imageView.layer.cornerRadius = 50.0;
        imageView.layer.borderColor = [UIColor whiteColor].CGColor;
        imageView.layer.borderWidth = 3.0f;
        imageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
        imageView.layer.shouldRasterize = YES;
        imageView.clipsToBounds = YES;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, 0, 24)];
        label.text = @"BILLY HO";
        label.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
        [label sizeToFit];
        label.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        
        [view addSubview:imageView];
        [view addSubview:label];
        view;
    });

}

#pragma mark -
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:17];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex
{
    if (sectionIndex == 0)
        return 0;
    return 34;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UINavigationController *navigationController = (UINavigationController *)self.frostedViewController.contentViewController;
	
    if (indexPath.row == 0)
	{
        PiSettingViewController *settingView = [[PiSettingViewController alloc] initWithNibName:@"PiSettingViewController" bundle:nil];
		settingView.navigationItem.title = @"设置";
		[navigationController pushViewController:settingView animated:YES];
    }
	else if (indexPath.row == 1)
	{
		PiFavouriteViewController *infoView = [[PiFavouriteViewController alloc] initWithNibName:@"PiFavouriteViewController" bundle:nil];
		navigationController.navigationBarHidden = NO;
		infoView.navigationItem.title = @"收藏列表";
		infoView.navigationController.navigationBarHidden = NO;
		[navigationController pushViewController:infoView animated:YES];
	}
	else if (indexPath.row == 2)
	{
        PiFeedbackViewController *feedbackview = [[PiFeedbackViewController alloc] initWithNibName:@"PiFeedbackViewController" bundle:nil];
		navigationController.navigationBarHidden = NO;
		feedbackview.navigationItem.title = @"意见反馈";
		[navigationController pushViewController:feedbackview animated:YES];
    }
    
    [self.frostedViewController hideMenuViewController];
}

#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
	NSArray *titles = @[@"设置", @"收藏", @"反馈"];
	NSArray *pics = @[[UIImage imageNamed:@"Setting"], [UIImage imageNamed:@"Favourite"], [UIImage imageNamed:@"Feedback"]];
	cell.textLabel.text = titles[indexPath.row];
	cell.imageView.image = pics[indexPath.row];
    return cell;
}


@end
