//
//  AddAssignmentViewController.m
//  Just.Do
//
//  Created by 戴宏穎 on 2013/12/23.
//  Copyright (c) 2013年 戴 宏穎. All rights reserved.
//

#import "AddAssignmentViewController.h"
#import "AppDelegate.h"
@interface AddAssignmentViewController ()

@end

@implementation AddAssignmentViewController
@synthesize assignmentName;
@synthesize deadlinePicker;
@synthesize prioritySlider;
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
    deadlinePicker.minimumDate = [NSDate date];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"setAssignmentReturn"]) {
        int priority = (int)self.prioritySlider.value;
        [prioritySlider setValue:priority];
        NSDate *deadline = self.deadlinePicker.date;
        if ([self.assignmentName.text length]) {
            NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
            [dateFormat setDateFormat:@"yyyy"];
            int year = [[dateFormat stringFromDate:deadline] integerValue];
            [dateFormat setDateFormat:@"M"];
            int month = [[dateFormat stringFromDate:deadline] integerValue];
            [dateFormat setDateFormat:@"day"];
            int day = [[dateFormat stringFromDate:deadline] integerValue];
            [dateFormat setDateFormat:@"H"];
            int hour = [[dateFormat stringFromDate:deadline] integerValue];
            [dateFormat setDateFormat:@"mm"];
            int mini = [[dateFormat stringFromDate:deadline] integerValue];
            NSLog(@"%d %d %d %d", year, month, day, hour);
            
            NSDate *currentDate = [NSDate date];
            [dateFormat setDateFormat:@"yyyy"];
            int currentYear = [[dateFormat stringFromDate:currentDate] integerValue];
            [dateFormat setDateFormat:@"M"];
            int currentMonth = [[dateFormat stringFromDate:currentDate] integerValue];
            [dateFormat setDateFormat:@"day"];
            int currentDay = [[dateFormat stringFromDate:currentDate] integerValue];
            [dateFormat setDateFormat:@"H"];
            int currentHour = [[dateFormat stringFromDate:currentDate] integerValue];
            NSLog(@"%d %d %d %d", currentYear, currentMonth, currentDay, currentHour);
            
            int priorityFactor = priority*10 - (year - currentYear)*100 - (month - currentMonth)*10 - (day - currentDay)*5 - (hour - currentHour)*1;
            
            AppDelegate* delegate = [[UIApplication sharedApplication] delegate];
            NSManagedObjectContext *context = [delegate managedObjectContext];
            NSEntityDescription *entity = [NSEntityDescription
                                           entityForName:@"Assignment" inManagedObjectContext:context];
            NSManagedObject *newManagedObject = [NSEntityDescription
                                                 insertNewObjectForEntityForName:[entity name]
                                                 inManagedObjectContext:context];
            [newManagedObject setValue:self.assignmentName.text forKey:@"title"];
            [newManagedObject setValue:[NSNumber numberWithInt:priority] forKey:@"priority"];
            [newManagedObject setValue:[NSNumber numberWithInt:year] forKey:@"year"];
            [newManagedObject setValue:[NSNumber numberWithInt:month] forKey:@"month"];
            [newManagedObject setValue:[NSNumber numberWithInt:day] forKey:@"day"];
            [newManagedObject setValue:[NSNumber numberWithInt:hour] forKey:@"hour"];
            [newManagedObject setValue:[NSNumber numberWithInt:mini] forKey:@"mini"];
            [newManagedObject setValue:[NSNumber numberWithInt:priorityFactor] forKey:@"sortfactor"];
            // Save the context.
            NSError *error = nil;
            if (![context save:&error]) {
                NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
                abort();
            }
        }
    }
}

@end
