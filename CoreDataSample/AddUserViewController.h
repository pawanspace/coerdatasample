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

@interface AddUserViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic) MasterViewController *masterViewController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (weak, nonatomic) IBOutlet UITextField *name;

@property (strong, nonatomic) IBOutlet UITextField *email;

@property (strong, nonatomic) IBOutlet UITextField *phoneNumber;

@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@property (strong, nonatomic) User *user;

@property (strong, nonatomic) IBOutlet UIImageView *userImage;

- (IBAction)addImage:(id)sender;

@end


