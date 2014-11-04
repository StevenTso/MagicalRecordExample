//
//  MainSet.h
//  CoreData
//
//  Created by Tso, Steven on 11/3/14.
//  Copyright (c) 2014 Tso, Steven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MainSet : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * value;

@end
