//
//  Job.h
//  CoreDataSample
//
//  Created by Chopra, Pawan on 5/2/14.
//  Copyright (c) 2014 dummiesmind. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class User;

@interface Job : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *jobToUser;
@end

@interface Job (CoreDataGeneratedAccessors)

- (void)addJobToUserObject:(User *)value;
- (void)removeJobToUserObject:(User *)value;
- (void)addJobToUser:(NSSet *)values;
- (void)removeJobToUser:(NSSet *)values;

@end
