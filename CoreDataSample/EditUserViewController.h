//
//  EditUserViewController.h
//  CoreDataSample
//
//  Created by Pawan Chopra on 5/3/14.
//  Copyright (c) 2014 dummiesmind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import <CoreData/CoreData.h>

@interface EditUserViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) User *user;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *email;

@property (strong, nonatomic) IBOutlet UITextField *phone;




@end
