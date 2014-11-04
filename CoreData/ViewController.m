//
//  ViewController.m
//  CoreData
//
//  Created by Tso, Steven on 11/3/14.
//  Copyright (c) 2014 Tso, Steven. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self coreData];
}

- (void)coreData {
    NSArray *returnArr;
    MainSet *entry;
    
    //init
    for(int i=0; i<4; i++) {
        entry = [MainSet MR_createEntity];
        entry.name = @"Test";
        entry.value = [NSNumber numberWithInt: i];
    }
    [self printData:@"init"];
    
    //update
    returnArr = [MainSet MR_findAllSortedBy:@"value" ascending:YES];
    [MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext){
        MainSet *entry = (MainSet *)returnArr[1];
        entry.name = @"CHANGED";
        entry.value = [NSNumber numberWithInt: 100];
    }];
    [self printData:@"update"];
    
    //delete
    returnArr = [MainSet MR_findAllSortedBy:@"value" ascending:YES];
    entry = (MainSet *)returnArr[1];
    [entry MR_deleteEntity];
    [self printData:@"delete"];
    
    //add
    entry = [MainSet MR_createEntity];
    entry.name = @"SAVE";
    entry.value = [NSNumber numberWithInt:4];
    [self printData:@"save"];
}

- (void)printData:(NSString *)print {
    NSLog(@"%@", print);
    NSArray *returnArr = [MainSet MR_findAllSortedBy:@"value" ascending:YES];
    for(int i=0; i<returnArr.count; i++) {
        MainSet *entry = (MainSet *)returnArr[i];
        NSLog(@"Index: %d, %@   %d", i, entry.name, entry.value.intValue);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
