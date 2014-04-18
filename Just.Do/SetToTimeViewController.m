//
//  SetToTimeViewController.m
//  Just.Do
//
//  Created by 戴宏穎 on 2014/1/11.
//  Copyright (c) 2014年 戴 宏穎. All rights reserved.
//

#import "SetToTimeViewController.h"
#import "AppDelegate.h"
@interface SetToTimeViewController ()

@end

@implementation SetToTimeViewController
@synthesize ToTimePicker;
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"SetToTimeReturn"]) {
        NSDate *date = [NSDate date];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd-HH:mm:ss"];
        NSString *timeStamp = [dateFormat stringFromDate:date];
        AppDelegate* delegate = [[UIApplication sharedApplication] delegate];
        NSManagedObjectContext *context = [delegate managedObjectContext];
        NSEntityDescription *entity = [NSEntityDescription
                                       entityForName:@"TempTimeStamp" inManagedObjectContext:context];
        NSManagedObject *newManagedObject = [NSEntityDescription
                                             insertNewObjectForEntityForName:[entity name]
                                             inManagedObjectContext:context];
        [newManagedObject setValue:timeStamp forKey:@"time"];
        NSDate *getDate = ToTimePicker.date;
        [dateFormat setDateFormat:@"HH"];
        int hour = [[dateFormat stringFromDate:getDate] integerValue];
        [newManagedObject setValue:[NSNumber numberWithInt:hour] forKey:@"hour"];
        [dateFormat setDateFormat:@"mm"];
        int mini = [[dateFormat stringFromDate:getDate] integerValue];
        [newManagedObject setValue:[NSNumber numberWithInt:mini] forKey:@"min"];
        [newManagedObject setValue:[NSNumber numberWithInt:2] forKey:@"type"];
        // Save the context.
        NSError *error = nil;
        if (![context save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
