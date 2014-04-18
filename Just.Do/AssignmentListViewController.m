//
//  AssignmentListViewController.m
//  Just.Do
//
//  Created by 戴宏穎 on 2014/1/13.
//  Copyright (c) 2014年 戴 宏穎. All rights reserved.
//

#import "AssignmentListViewController.h"
#import "AppDelegate.h"
@interface AssignmentListViewController ()
@end

@implementation AssignmentListViewController
@synthesize title1;
@synthesize title2;
@synthesize title3;
@synthesize title4;
@synthesize title5;
@synthesize deadline1;
@synthesize deadline2;
@synthesize deadline3;
@synthesize deadline4;
@synthesize deadline5;
@synthesize priority1;
@synthesize priority2;
@synthesize priority3;
@synthesize priority4;
@synthesize priority5;
@synthesize check1;
@synthesize check2;
@synthesize check3;
@synthesize check4;
@synthesize check5;

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
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureView
{
    AppDelegate* delegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [delegate managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Assignment" inManagedObjectContext:context];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"sortfactor" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    [fetchRequest setSortDescriptors:sortDescriptors];
    [fetchRequest setEntity:entity];
    NSError *error = nil;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest
                                                     error:&error];
    NSLog(@"%d", [fetchedObjects count]);
    int count = [fetchedObjects count];
    if (count >= 1) {
        title1.text = [[[fetchedObjects objectAtIndex:0] valueForKey:@"title"] description];
        int year = [[[[fetchedObjects objectAtIndex:0] valueForKey:@"year"] description] intValue];
        int month = [[[[fetchedObjects objectAtIndex:0] valueForKey:@"month"] description] intValue];
        int day = [[[[fetchedObjects objectAtIndex:0] valueForKey:@"day"] description] intValue];
        int hour = [[[[fetchedObjects objectAtIndex:0] valueForKey:@"hour"] description] intValue];
        int mini = [[[[fetchedObjects objectAtIndex:0] valueForKey:@"mini"] description] intValue];
        NSString *deadlineString = [NSString stringWithFormat:@"%d-%02d-%02d %02d:%02d", year, month, day, hour, mini];
        deadline1.text = deadlineString;
        int priority = [[[[fetchedObjects objectAtIndex:0] valueForKey:@"priority"] description] intValue];
        priority1.text = [NSString stringWithFormat:@"Priority : %d", priority];
        check1.hidden = false;
    }
    else
    {
        title1.text = @"";
        deadline1.text = @"";
        priority1.text = @"";
        check1.hidden = true;
    }
    if (count >= 2) {
        title2.text = [[[fetchedObjects objectAtIndex:1] valueForKey:@"title"] description];
        int year = [[[[fetchedObjects objectAtIndex:1] valueForKey:@"year"] description] intValue];
        int month = [[[[fetchedObjects objectAtIndex:1] valueForKey:@"month"] description] intValue];
        int day = [[[[fetchedObjects objectAtIndex:1] valueForKey:@"day"] description] intValue];
        int hour = [[[[fetchedObjects objectAtIndex:1] valueForKey:@"hour"] description] intValue];
        int mini = [[[[fetchedObjects objectAtIndex:1] valueForKey:@"mini"] description] intValue];
        NSString *deadlineString = [NSString stringWithFormat:@"%d-%02d-%02d %02d:%02d", year, month, day, hour, mini];
        deadline2.text = deadlineString;
        int priority = [[[[fetchedObjects objectAtIndex:1] valueForKey:@"priority"] description] intValue];
        priority2.text = [NSString stringWithFormat:@"Priority : %d", priority];
        check2.hidden = false;
    }
    else
    {
        title2.text = @"";
        deadline2.text = @"";
        priority2.text = @"";
        check2.hidden = true;
    }
    if (count >= 3) {
        title3.text = [[[fetchedObjects objectAtIndex:2] valueForKey:@"title"] description];
        int year = [[[[fetchedObjects objectAtIndex:2] valueForKey:@"year"] description] intValue];
        int month = [[[[fetchedObjects objectAtIndex:2] valueForKey:@"month"] description] intValue];
        int day = [[[[fetchedObjects objectAtIndex:2] valueForKey:@"day"] description] intValue];
        int hour = [[[[fetchedObjects objectAtIndex:2] valueForKey:@"hour"] description] intValue];
        int mini = [[[[fetchedObjects objectAtIndex:2] valueForKey:@"mini"] description] intValue];
        NSString *deadlineString = [NSString stringWithFormat:@"%d-%02d-%02d %02d:%02d", year, month, day, hour, mini];
        deadline3.text = deadlineString;
        int priority = [[[[fetchedObjects objectAtIndex:2] valueForKey:@"priority"] description] intValue];
        priority3.text = [NSString stringWithFormat:@"Priority : %d", priority];
        check3.hidden = false;
    }
    else
    {
        title3.text = @"";
        deadline3.text = @"";
        priority3.text = @"";
        check3.hidden = true;
    }
    if (count >= 4) {
        title4.text = [[[fetchedObjects objectAtIndex:3] valueForKey:@"title"] description];
        int year = [[[[fetchedObjects objectAtIndex:3] valueForKey:@"year"] description] intValue];
        int month = [[[[fetchedObjects objectAtIndex:3] valueForKey:@"month"] description] intValue];
        int day = [[[[fetchedObjects objectAtIndex:3] valueForKey:@"day"] description] intValue];
        int hour = [[[[fetchedObjects objectAtIndex:3] valueForKey:@"hour"] description] intValue];
        int mini = [[[[fetchedObjects objectAtIndex:3] valueForKey:@"mini"] description] intValue];
        NSString *deadlineString = [NSString stringWithFormat:@"%d-%02d-%02d %02d:%02d", year, month, day, hour, mini];
        deadline4.text = deadlineString;
        int priority = [[[[fetchedObjects objectAtIndex:3] valueForKey:@"priority"] description] intValue];
        priority4.text = [NSString stringWithFormat:@"Priority : %d", priority];
        check4.hidden = false;
    }
    else
    {
        title4.text = @"";
        deadline4.text = @"";
        priority4.text = @"";
        check4.hidden = true;
    }
    if (count >= 5) {
        title5.text = [[[fetchedObjects objectAtIndex:4] valueForKey:@"title"] description];
        int year = [[[[fetchedObjects objectAtIndex:4] valueForKey:@"year"] description] intValue];
        int month = [[[[fetchedObjects objectAtIndex:4] valueForKey:@"month"] description] intValue];
        int day = [[[[fetchedObjects objectAtIndex:4] valueForKey:@"day"] description] intValue];
        int hour = [[[[fetchedObjects objectAtIndex:4] valueForKey:@"hour"] description] intValue];
        int mini = [[[[fetchedObjects objectAtIndex:4] valueForKey:@"mini"] description] intValue];
        NSString *deadlineString = [NSString stringWithFormat:@"%d-%02d-%02d %02d:%02d", year, month, day, hour, mini];
        deadline5.text = deadlineString;
        int priority = [[[[fetchedObjects objectAtIndex:4] valueForKey:@"priority"] description] intValue];
        priority5.text = [NSString stringWithFormat:@"Priority : %d", priority];
        check5.hidden = false;
    }
    else
    {
        title5.text = @"";
        deadline5.text = @"";
        priority5.text = @"";
        check5.hidden = true;
    }
    
}
- (IBAction)checkbutton1:(id)sender {
    AppDelegate* delegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [delegate managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Assignment" inManagedObjectContext:context];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"sortfactor" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    [fetchRequest setSortDescriptors:sortDescriptors];
    [fetchRequest setEntity:entity];
    NSError *error = nil;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest
                                                     error:&error];
    [context deleteObject:[fetchedObjects objectAtIndex:0]];
    [self configureView];
}
- (IBAction)checkbutton2:(id)sender {
    AppDelegate* delegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [delegate managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Assignment" inManagedObjectContext:context];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"sortfactor" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    [fetchRequest setSortDescriptors:sortDescriptors];
    [fetchRequest setEntity:entity];
    NSError *error = nil;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest
                                                     error:&error];
    [context deleteObject:[fetchedObjects objectAtIndex:1]];
    [self configureView];
}
- (IBAction)checkbutton3:(id)sender {
    AppDelegate* delegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [delegate managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Assignment" inManagedObjectContext:context];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"sortfactor" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    [fetchRequest setSortDescriptors:sortDescriptors];
    [fetchRequest setEntity:entity];
    NSError *error = nil;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest
                                                     error:&error];
    [context deleteObject:[fetchedObjects objectAtIndex:2]];
    [self configureView];
}

- (IBAction)checkbutton4:(id)sender {
    AppDelegate* delegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [delegate managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Assignment" inManagedObjectContext:context];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"sortfactor" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    [fetchRequest setSortDescriptors:sortDescriptors];
    [fetchRequest setEntity:entity];
    NSError *error = nil;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest
                                                     error:&error];
    [context deleteObject:[fetchedObjects objectAtIndex:3]];
    [self configureView];
}

- (IBAction)chechbutton5:(id)sender {
    AppDelegate* delegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [delegate managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Assignment" inManagedObjectContext:context];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"sortfactor" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    [fetchRequest setSortDescriptors:sortDescriptors];
    [fetchRequest setEntity:entity];
    NSError *error = nil;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest
                                                     error:&error];
    [context deleteObject:[fetchedObjects objectAtIndex:4]];
    [self configureView];
}

@end
