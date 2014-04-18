//
//  AddClassViewController.h
//  Just.Do
//
//  Created by 戴宏穎 on 2013/12/23.
//  Copyright (c) 2013年 戴 宏穎. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddClassViewController : UIViewController
{
    int startHour, startMin;
    int endHour, endMin;
}

@property (weak, nonatomic) IBOutlet UITextField *ClassLabel;
@property (weak, nonatomic) IBOutlet UITextField *LocationLabel;
@property (strong, nonatomic)        NSArray *hourArray;
@property (strong, nonatomic)        NSArray *minArray;
@property (weak, nonatomic) IBOutlet UIButton *FromTimeButton;
@property (weak, nonatomic) IBOutlet UIButton *ToTimeButton;
@property (weak, nonatomic) IBOutlet UILabel *weekLabel;
@property (weak, nonatomic) IBOutlet UISlider *weekSlider;
@property (weak, nonatomic) IBOutlet UISlider *prioritySlider;

- (IBAction)setTimeLabelDone:(UIStoryboardSegue *)segue;
@end
