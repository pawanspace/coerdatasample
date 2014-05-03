//
//  AddUserViewController.h
//  CoreDataSample
//
//  Created by Chopra, Pawan on 5/2/14.
//  Copyright (c) 2014 dummiesmind. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MasterViewController;
#import "User.h"

#import <CoreData/CoreData.h>

@interface AddUserViewController : UIViewController

@property (strong, nonatomic) MasterViewController *masterViewController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
//@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@property (weak, nonatomic) IBOutlet UITextField *name;

@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@property (strong, nonatomic) User *user;

@end
