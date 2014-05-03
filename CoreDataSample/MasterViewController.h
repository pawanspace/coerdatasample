//
//  MasterViewController.h
//  CoreDataSample
//
//  Created by Chopra, Pawan on 5/2/14.
//  Copyright (c) 2014 dummiesmind. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;
@class AddUserViewController;

#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;

@property (strong, nonatomic) AddUserViewController *addUserViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
