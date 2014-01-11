//
//  SetTimeViewController.m
//  Just.Do
//
//  Created by 戴宏穎 on 2014/1/6.
//  Copyright (c) 2014年 戴 宏穎. All rights reserved.
//

#import "SetTimeViewController.h"

@interface SetTimeViewController ()
@end

@implementation SetTimeViewController
@synthesize SetTimeLabel;
@synthesize FromTimePicker;
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
    [self loadTime];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadTime
{
    
}

- (void)setTimeLabel:(id)newTimeLabel
{
    if (SetTimeLabel != newTimeLabel) {
        SetTimeLabel = newTimeLabel;
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    NSString *timeString = SetTimeLabel.titleLabel.text;
    NSLog(@"%@", timeString);
}
@end
