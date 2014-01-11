//
//  AddClassViewController.m
//  Just.Do
//
//  Created by 戴宏穎 on 2013/12/23.
//  Copyright (c) 2013年 戴 宏穎. All rights reserved.
//

#import "AddClassViewController.h"
#import "SetTimeViewController.h"
@interface AddClassViewController ()
@end

@implementation AddClassViewController
@synthesize hourArray;
@synthesize minArray;
@synthesize SetTimeLabel;
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
    [self loadArray];
    [self setUpPickerView];
    
}

- (void)loadArray
{
    hourArray = [[NSArray alloc] initWithObjects:
                    @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10",
                    @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20",
                    @"21", @"22", @"23", @"24", nil];
    minArray = [[NSArray alloc] initWithObjects:
                @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10",
                @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20",
                @"21", @"22", @"23", @"24", @"25", @"26", @"27", @"28", @"29", @"30",
                @"31", @"32", @"33", @"34", @"35", @"36", @"37", @"38", @"39", @"40",
                @"41", @"42", @"43", @"44", @"45", @"46", @"47", @"48", @"49", @"50",
                @"51", @"52", @"53", @"54", @"55", @"56", @"57", @"58", @"59", @"60", nil];
    
}

- (void)setUpPickerView
{
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

- (IBAction)setTimeLabelDone:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"SetTimeDone"]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"SetTime"]) {
        [[segue destinationViewController] setTimeLabel:SetTimeLabel];
    }
}
@end
