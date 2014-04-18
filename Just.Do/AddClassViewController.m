//
//  AddClassViewController.m
//  Just.Do
//
//  Created by 戴宏穎 on 2013/12/23.
//  Copyright (c) 2013年 戴 宏穎. All rights reserved.
//

#import "AddClassViewController.h"
#import "AppDelegate.h"
@interface AddClassViewController ()
@end

@implementation AddClassViewController
@synthesize hourArray;
@synthesize minArray;
@synthesize prioritySlider;
@synthesize ClassLabel;
@synthesize LocationLabel;
@synthesize FromTimeButton;
@synthesize ToTimeButton;
@synthesize weekLabel;
@synthesize weekSlider;

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
    if ([[segue identifier] isEqualToString:@"SetFromTimeReturn"]) {
        [self renewView];
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
    else if ([[segue identifier] isEqualToString:@"SetToTimeReturn"]) {
        [self renewView];
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}


- (IBAction)takeWeekOfSlider:(UISlider *)sender
{
    int weekday = (int)self.weekSlider.value;
    self.weekSlider.value = weekday;
    NSArray *week = [[NSArray alloc] initWithObjects:
                     @"", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", @"星期日", nil];
    self.weekLabel.text = [week objectAtIndex:weekday];
}
- (void)renewView
{
    AppDelegate* delegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [delegate managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"TempTimeStamp" inManagedObjectContext:context];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"time" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    [fetchRequest setSortDescriptors:sortDescriptors];
    [fetchRequest setEntity:entity];
    NSError *error = nil;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest
                                                     error:&error];
    int hour = [[[[fetchedObjects objectAtIndex:0]valueForKey:@"hour"]description] intValue];
    int min = [[[[fetchedObjects objectAtIndex:0]valueForKey:@"min"]description] intValue];
    int type = [[[[fetchedObjects objectAtIndex:0]valueForKey:@"type"]description] intValue];
    NSString *str = [NSString stringWithFormat:@"%02d:%02d", hour, min];
    NSLog(@"Time >> %@", str);
    if (type == 1) {
        [self.FromTimeButton setTitle:str forState:UIControlStateNormal];
        startHour = hour;
        startMin = min;
    }
    else
    {
        [self.ToTimeButton setTitle:str forState:UIControlStateNormal];
        endHour = hour;
        endMin = min;
    }
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"SetClassReturn"]) {
        int priority = (int)self.prioritySlider.value;
        [prioritySlider setValue:priority];
        
        if ([self.ClassLabel.text length] && [self.LocationLabel.text length]) {
            AppDelegate* delegate = [[UIApplication sharedApplication] delegate];
            NSManagedObjectContext *context = [delegate managedObjectContext];
            NSEntityDescription *entity = [NSEntityDescription
                                           entityForName:@"CClass" inManagedObjectContext:context];
            NSManagedObject *newManagedObject = [NSEntityDescription
                                                 insertNewObjectForEntityForName:[entity name]
                                                 inManagedObjectContext:context];
            [newManagedObject setValue:self.ClassLabel.text forKey:@"classname"];
            [newManagedObject setValue:self.LocationLabel.text forKey:@"location"];
            [newManagedObject setValue:[NSNumber numberWithInt:priority] forKey:@"priority"];
            [newManagedObject setValue:[NSNumber numberWithInt:(int)weekSlider.value] forKey:@"week"];
            [newManagedObject setValue:[NSNumber numberWithInt:startHour] forKey:@"startHour"];
            [newManagedObject setValue:[NSNumber numberWithInt:startMin] forKey:@"startMin"];
            [newManagedObject setValue:[NSNumber numberWithInt:endHour] forKey:@"endHour"];
            [newManagedObject setValue:[NSNumber numberWithInt:endMin] forKey:@"endMin"];
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
