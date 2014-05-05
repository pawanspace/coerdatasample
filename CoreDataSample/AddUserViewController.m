//
//  AddUserViewController.m
//  CoreDataSample
//
//  Created by Chopra, Pawan on 5/2/14.
//  Copyright (c) 2014 dummiesmind. All rights reserved.
//

#import "AddUserViewController.h"

#import "MasterViewController.h"

#import "Job.h"
#import "User.h"

@interface AddUserViewController ()

@end

@implementation AddUserViewController

@synthesize user = _user;

@synthesize name = _name;

@synthesize email = _email;

@synthesize phoneNumber = _phoneNumber;

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
  //  self.masterViewController = (MasterViewController *)[[UIViewController alloc] init];
   // [self.navigationController pushViewController:self.masterViewController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addImage:(id)sender {
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    //If device has camera
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    }
    else{
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    
    [imagePicker setDelegate:self];
    
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //Get image from selection
    
    UIImage *imageFromSelection = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    //put that image to image view;
    [self.userImage setImage:imageFromSelection];
    
    //remove image picker
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


- (IBAction)backgroundTouched:(id)sender {
    [self.view endEditing:YES];
}



- (IBAction)inserUser:(id)sender {
    
    NSString *imageName = [[self.name.text stringByReplacingOccurrencesOfString:@" "  withString:@"_"] stringByAppendingString:@".png"];
    
    NSData *pngData = UIImagePNGRepresentation(self.userImage.image);
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentdsPath = [paths objectAtIndex:0];
    NSLog(@"%@",documentdsPath);
    NSString *filePath = [documentdsPath stringByAppendingPathComponent:imageName];
    [pngData writeToFile:filePath atomically:YES];
    
    
   self.user = [NSEntityDescription
                    insertNewObjectForEntityForName:@"User"
                    inManagedObjectContext:self.managedObjectContext];

    Job *job =  [NSEntityDescription
                              insertNewObjectForEntityForName:@"Job"
                              inManagedObjectContext:self.managedObjectContext];

   
    [job setName:@"My First Job"];
    
    // Save the context.
    NSError *error = nil;
    if (![job.managedObjectContext save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    [self.user addUserToJobObject:job];
    
    if(_user == nil){
        NSLog(@"User is null");
    }
    
    [self.user setName:self.name.text];
    [self.user setEmail:self.email.text];
    
    [self.user setThumbnailDataFromImage:self.userImage.image];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterNoStyle];
    
    [self.user setPhone: [formatter numberFromString:self.phoneNumber.text]];

    // Save the context.
    error = nil;
    if (![self.managedObjectContext save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    //self.masterViewController = [self.storyboard  instantiateViewControllerWithIdentifier:@"master"];
  //  [self.navigationController pushViewController:self.masterViewController animated:YES];

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
