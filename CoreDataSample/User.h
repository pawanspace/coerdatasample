//
//  User.h
//  CoreDataSample
//
//  Created by Chopra, Pawan on 5/2/14.
//  Copyright (c) 2014 dummiesmind. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *userToJob;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)addUserToJobObject:(NSManagedObject *)value;
- (void)removeUserToJobObject:(NSManagedObject *)value;
- (void)addUserToJob:(NSSet *)values;
- (void)removeUserToJob:(NSSet *)values;

@end
