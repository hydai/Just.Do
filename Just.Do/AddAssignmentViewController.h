//
//  AddAssignmentViewController.h
//  Just.Do
//
//  Created by 戴宏穎 on 2013/12/23.
//  Copyright (c) 2013年 戴 宏穎. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddAssignmentViewController : UIViewController 
@property (weak, nonatomic) IBOutlet UITextField *assignmentName;
@property (weak, nonatomic) IBOutlet UIDatePicker *deadlinePicker;
@property (weak, nonatomic) IBOutlet UISlider *prioritySlider;

@end
