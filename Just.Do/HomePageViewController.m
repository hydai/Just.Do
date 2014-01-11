//
//  HomePageViewController.m
//  Just.Do
//
//  Created by 戴宏穎 on 2013/12/23.
//  Copyright (c) 2013年 戴 宏穎. All rights reserved.
//

#import "HomePageViewController.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController
@synthesize currentTime;
@synthesize updateTimer;
@synthesize DateLabel;
@synthesize ClockLabel;
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
    [self updateSubject];
    [self updateTime];
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateSubject
{
    [[self Class1] setText:@"線性代數"];
    [[self Class2] setText:@"歌劇賞析"];
    [[self Class3] setText:@"Objective-C"];
    [[self Location1] setText:@"台達館 106"];
    [[self Location2] setText:@"工程一館 101"];
    [[self Location3] setText:@"EECS 128"];
    [[self Time1] setText:@"10:10-12:00"];
    [[self Time2] setText:@"13:20-15:10"];
    [[self Time3] setText:@"15:30-18:20"];
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
    currentmonthStr = [NSString stringWithFormat:@"%@ %ld, %@", monthStr[currentmonth-1], currentday, [currentweekdayStr substringToIndex:3]];
    DateLabel.text = currentmonthStr;
    NSLog(@"%@", currentmonthStr);
}


@end
