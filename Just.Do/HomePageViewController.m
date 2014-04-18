//
//  HomePageViewController.m
//  Just.Do
//
//  Created by 戴宏穎 on 2013/12/23.
//  Copyright (c) 2013年 戴 宏穎. All rights reserved.
//

#import "HomePageViewController.h"
#import "AddAssignmentViewController.h"
#import "AppDelegate.h"
@interface HomePageViewController ()

@end

@implementation HomePageViewController
@synthesize currentTime;
@synthesize updateTimer;
@synthesize DateLabel;
@synthesize ClockLabel;
@synthesize Class1;
@synthesize Class2;
@synthesize Location1;
@synthesize Location2;
@synthesize Time1;
@synthesize Time2;
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
    [self updateTime];
    [super viewDidLoad];
    [self updateSubject];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateSubject
{
    AppDelegate* delegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [delegate managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"CClass" inManagedObjectContext:context];
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSLog(@"before ask hour and min");
    [formatter setDateFormat:@"e"];
    NSString *currentweekdayStr = [NSString stringWithFormat:@"%@", [formatter stringFromDate:currentTime]];
    int currentWeekday = [currentweekdayStr intValue];
    [formatter setDateFormat:@"HH"];
    NSString *currentHourStr = [NSString stringWithFormat:@"%@", [formatter stringFromDate:currentTime]];
    int currentHour = [currentHourStr intValue];
    [formatter setDateFormat:@"MM"];
    NSString *currentMinStr = [NSString stringWithFormat:@"%@", [formatter stringFromDate:currentTime]];
    int currentMin = [currentMinStr intValue];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"startHour" ascending:YES];
    NSArray *sortDescriptors = @[sortDescriptor];
    [fetchRequest setSortDescriptors:sortDescriptors];
    [fetchRequest setEntity:entity];
    NSError *error = nil;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:
                              @"(week == %d) AND ((startHour > %d) OR ((startHour == %d) AND (startMin > %d)))", currentWeekday-1, currentHour, currentHour, currentMin];
    
    [fetchRequest setPredicate:predicate];
    NSLog(@"before fetch");
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest
                                                     error:&error];
    NSLog(@"%d", [fetchedObjects count]);
    int count = [fetchedObjects count];
    int i;
    for (i = 0; i < count; i++)
    {
        int tmphour = [[[[fetchedObjects objectAtIndex:i] valueForKey:@"startHour"] description] intValue];
        int tmpmin = [[[[fetchedObjects objectAtIndex:i] valueForKey:@"startMin"] description] intValue];
        NSLog(@"current time %d:%d", currentHour, currentMin);
        NSLog(@"tmp time %d:%d", tmphour, tmpmin);
        if (tmphour > currentHour || (tmphour == currentHour && tmpmin > currentMin)) {
            break;
        }
    }
    if (count >= i+1) {
        self.Class1.text = [[[fetchedObjects objectAtIndex:i] valueForKey:@"classname"] description];
        int sthour = [[[[fetchedObjects objectAtIndex:i] valueForKey:@"startHour"] description] intValue];
        int stmin = [[[[fetchedObjects objectAtIndex:i] valueForKey:@"startMin"] description] intValue];
        int edhour = [[[[fetchedObjects objectAtIndex:i] valueForKey:@"endHour"] description] intValue];
        int edmin = [[[[fetchedObjects objectAtIndex:i] valueForKey:@"endMin"] description] intValue];
        NSString *deadlineString = [NSString stringWithFormat:@"%02d:%02d - %02d:%02d", sthour, stmin, edhour, edmin];
        self.Time1.text = deadlineString;
        self.Location1.text = [[[fetchedObjects objectAtIndex:i] valueForKey:@"location"] description];
    }
    else
    {
        self.Class1.text = @"";
        self.Location1.text = @"";
        self.Time1.text = @"";
    }
    if (count >= i+2) {
        self.Class2.text = [[[fetchedObjects objectAtIndex:i+1] valueForKey:@"classname"] description];
        int sthour = [[[[fetchedObjects objectAtIndex:i+1] valueForKey:@"startHour"] description] intValue];
        int stmin = [[[[fetchedObjects objectAtIndex:i+1] valueForKey:@"startMin"] description] intValue];
        int edhour = [[[[fetchedObjects objectAtIndex:i+1] valueForKey:@"endHour"] description] intValue];
        int edmin = [[[[fetchedObjects objectAtIndex:i+1] valueForKey:@"endMin"] description] intValue];
        NSString *deadlineString = [NSString stringWithFormat:@"%02d:%02d - %02d:%02d", sthour, stmin, edhour, edmin];
        self.Time2.text = deadlineString;
        self.Location2.text = [[[fetchedObjects objectAtIndex:i+1] valueForKey:@"location"] description];
    }
    else
    {
        self.Class2.text = @"";
        self.Location2.text = @"";
        self.Time2.text = @"";
    }
//
//    [[self Class1] setText:@"線性代數"];
//    [[self Class2] setText:@"歌劇賞析"];
//    [[self Location1] setText:@"台達館 106"];
//    [[self Location2] setText:@"工程一館 101"];
//    [[self Time1] setText:@"10:10-12:00"];
//    [[self Time2] setText:@"13:20-15:10"];
}

- (void)updateTime
{
    [updateTimer invalidate];
    updateTimer = nil;
    
    currentTime = [NSDate date];
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    [timeFormatter setTimeStyle:NSDateFormatterShortStyle];
    NSLog(@"%@", [timeFormatter stringFromDate:currentTime]);
    ClockLabel.text = [timeFormatter stringFromDate:currentTime];
    updateTimer = [NSTimer scheduledTimerWithTimeInterval:60
                                                   target:self
                                                 selector:@selector(updateTime)
                                                 userInfo:nil
                                                  repeats:YES];
    NSDateFormatter *day = [[NSDateFormatter alloc] init];
    NSDateFormatter *month = [[NSDateFormatter alloc] init];
    NSDateFormatter *weekday = [[NSDateFormatter alloc] init];
    [weekday setDateFormat:@"EEEE"];
    [day setDateFormat:@"dd"];
    [month setDateFormat:@"MM"];
    NSString *currentdayStr = [NSString stringWithFormat:@"%@", [day stringFromDate:currentTime]];
    NSString *currentmonthStr = [NSString stringWithFormat:@"%@", [month stringFromDate:currentTime]];
    NSString *currentweekdayStr = [NSString stringWithFormat:@"%@", [weekday stringFromDate:currentTime]];
    NSLog(@"%@", currentweekdayStr);
    NSInteger currentday = [currentdayStr integerValue];
    NSInteger currentmonth = [currentmonthStr integerValue];
    NSString *monthStr[12] = {@"Jan", @"Feb", @"Mar", @"Apr", @"May", @"June", @"July", @"Aug", @"Sep", @"Oct", @"Nov", @"Dec"};
    // set currentmonthStr
    currentmonthStr = [NSString stringWithFormat:@"%@ %ld, %@", monthStr[currentmonth-1], (long)currentday, [currentweekdayStr substringToIndex:3]];
    DateLabel.text = currentmonthStr;
    NSLog(@"%@", currentmonthStr);
}
- (IBAction)setAssignmentDone:(UIStoryboardSegue *)segue
{
    [self updateSubject];
    
    if ([[segue identifier] isEqualToString:@"setAssignmentReturn"]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}
- (IBAction)setClassDone:(UIStoryboardSegue *)segue
{
    [self updateSubject];
    if ([[segue identifier] isEqualToString:@"SetClassReturn"]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}
@end
