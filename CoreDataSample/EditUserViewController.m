//
//  EditUserViewController.m
//  CoreDataSample
//
//  Created by Pawan Chopra on 5/3/14.
//  Copyright (c) 2014 dummiesmind. All rights reserved.
//

#import "EditUserViewController.h"
#import "User.h"

@interface EditUserViewController ()
    @property (strong, nonatomic) UIPopoverController *masterPopoverController;
    - (void)configureView;
@end

@implementation EditUserViewController

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

#pragma mark - Managing the User item
- (void)setUser:(User*)userItem
{
    if (_user != userItem) {
        _user = userItem;
        
        // Update the view.
        [self configureView];
    }
    
    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }

}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.user) {
        self.name.text = [[self.user valueForKey:@"name"] description];
        self.email.text = [[self.user valueForKey:@"email"] description];
        self.phone.text = [[self.user valueForKey:@"phone"] description];
    }
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)editUser:(id)sender {
    
//    
//    NSFetchRequest *request = [[NSFetchRequest alloc] init];
//    [request setEntity:[NSEntityDescription entityForName:@"User" inManagedObjectContext:self.managedObjectContext]];
//
//    NSPredicate *predicate = [NSPredicate predicateWithFormat: @"(self = %@)", self.user];
//    [request setPredicate:predicate];
//    NSError *errorFetch = nil;
//    NSArray *results = [self.user.managedObjectContext executeFetchRequest:request error:&errorFetch];
//    
//    
//   User *fetchedUser = [results objectAtIndex:0];
    
    [self.user setName:self.name.text];
    [self.user setEmail:self.email.text];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterNoStyle];
    
    [self.user setPhone: [formatter numberFromString:self.phone.text]];
    
    // Save the context.
    NSError *error = nil;
    if (![self.managedObjectContext save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }

    
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
