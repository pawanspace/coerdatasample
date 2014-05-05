//
//  DetailViewController.h
//  CoreDataSample
//
//  Created by Chopra, Pawan on 5/2/14.
//  Copyright (c) 2014 dummiesmind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditUserViewController.h"


@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

@property (strong, nonatomic) IBOutlet UILabel *phoneLabel;
@property (strong, nonatomic) IBOutlet UILabel *emailLabel;
@property (strong, nonatomic) IBOutlet UITextField *nameDesc;
@property (strong, nonatomic) IBOutlet UIButton *editUser;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong, nonatomic) IBOutlet UIImageView *userImage;

@property (strong, nonatomic) EditUserViewController *editUserViewController;

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
