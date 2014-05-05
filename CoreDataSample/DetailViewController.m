//
//  DetailViewController.m
//  CoreDataSample
//
//  Created by Chopra, Pawan on 5/2/14.
//  Copyright (c) 2014 dummiesmind. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(contextSaved:) name:NSManagedObjectContextDidSaveNotification object:self.managedObjectContext];
    if (self.detailItem) {
        self.nameDesc.text = [[self.detailItem valueForKey:@"name"] description];
        self.emailLabel.text = [[self.detailItem valueForKey:@"email"] description];
        self.phoneLabel.text = [[self.detailItem valueForKey:@"phone"] description];
        NSString *imageName = [[[[self.detailItem valueForKey:@"name"] description] stringByReplacingOccurrencesOfString:@" "  withString:@"_"] stringByAppendingString:@".png"];
        NSString *filePath = [self getDocumentPathForFileName:imageName];
        
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        
        UIImage *image = [UIImage imageWithData:data];
        
        self.userImage.image = image;
        
    }
}




- (void) contextSaved:(id)sender{

    self.nameDesc.text = [[self.detailItem valueForKey:@"name"] description];
    self.nameDesc.enabled = NO;
    self.emailLabel.text = [[self.detailItem valueForKey:@"email"] description];
    self.phoneLabel.text = [[self.detailItem valueForKey:@"phone"] description];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"editUser"]) {
        [[segue destinationViewController] setManagedObjectContext:self.managedObjectContext];
        [[segue destinationViewController] setUser:self.detailItem ];
    }
}


- (NSString*) getDocumentPathForFileName:(NSString*)name
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentdsPath = [paths objectAtIndex:0];
    NSString *filePath = [documentdsPath stringByAppendingPathComponent:name];
    return filePath;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.editUserViewController = (EditUserViewController*)[[self.splitViewController.viewControllers lastObject] topViewController];
    self.editUserViewController.managedObjectContext = self.managedObjectContext;
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}


- (IBAction)editUser:(id)sender {
    self.nameDesc.enabled = YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
