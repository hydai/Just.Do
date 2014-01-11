//
//  HomePageViewController.h
//  Just.Do
//
//  Created by 戴宏穎 on 2013/12/23.
//  Copyright (c) 2013年 戴 宏穎. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@interface HomePageViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *DateLabel;
@property (weak, nonatomic) IBOutlet UILabel *ClockLabel;
@property (weak, nonatomic) IBOutlet UILabel *Class1;
@property (weak, nonatomic) IBOutlet UILabel *Location1;
@property (weak, nonatomic) IBOutlet UILabel *Time1;
@property (weak, nonatomic) IBOutlet UILabel *Class2;
@property (weak, nonatomic) IBOutlet UILabel *Location2;
@property (weak, nonatomic) IBOutlet UILabel *Time2;
@property (weak, nonatomic) IBOutlet UILabel *Class3;
@property (weak, nonatomic) IBOutlet UILabel *Location3;
@property (weak, nonatomic) IBOutlet UILabel *Time3;
@property NSDate *currentTime;
@property NSTimer *updateTimer;
@end
