//
//  User.h
//  CoreDataSample
//
//  Created by Pawan Chopra on 5/4/14.
//  Copyright (c) 2014 dummiesmind. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Job;

@interface User : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSNumber * phone;
@property (nonatomic, retain) UIImage *thumbnail;
@property (nonatomic, retain) NSData * thumbnailData;
@property (nonatomic, retain) NSSet *userToJob;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)addUserToJobObject:(Job *)value;
- (void)removeUserToJobObject:(Job *)value;
- (void)addUserToJob:(NSSet *)values;
- (void)removeUserToJob:(NSSet *)values;
-(void)setThumbnailDataFromImage:(UIImage *)image;
@end
