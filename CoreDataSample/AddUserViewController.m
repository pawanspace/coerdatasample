//
//  AddUserViewController.m
//  CoreDataSample
//
//  Created by Chopra, Pawan on 5/2/14.
//  Copyright (c) 2014 dummiesmind. All rights reserved.
//

#import "AddUserViewController.h"

#import "MasterViewController.h"

#import "User.h"

@interface AddUserViewController ()

@end

@implementation AddUserViewController

@synthesize user = _user;

@synthesize name = _name;
@synthesize managedObjectContext = _managedObjectContext;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.masterViewController = (MasterViewController *)[[UIViewController alloc] init];
    [self.navigationController pushViewController:self.masterViewController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)inserUser:(id)sender {
   self.user = [NSEntityDescription
                    insertNewObjectForEntityForName:@"User"
                    inManagedObjectContext:self.managedObjectContext];

    if(_user == nil){
        NSLog(@"User is null");
    }
    [self.user setName:self.name.text];

//    
//    NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
//    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:context];
//    
//    NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
//    
//    // If appropriate, configure the new managed object.
//    // Normally you should use accessor methods, but using KVC here avoids the need to add a custom class to the template.
//    [newManagedObject setValue:self.name forKey:@"name"];
//    
    // Save the context.
    NSError *error = nil;
    if (![self.user.managedObjectContext save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }

}


//
//#pragma mark - Fetched results controller
//
//- (NSFetchedResultsController *)fetchedResultsController
//{
//    if (_fetchedResultsController != nil) {
//        return _fetchedResultsController;
//    }
//    
//    NSFetchedResultsController *userFetchedResultsController = [[NSFetchedResultsController alloc] init];
//    
//    userFetchedResultsController.delegate = self;
//    self.fetchedResultsController = userFetchedResultsController;
//    
//    return _fetchedResultsController;
//}

@end
