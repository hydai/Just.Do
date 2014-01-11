//
//  SetTimeViewController.h
//  Just.Do
//
//  Created by 戴宏穎 on 2014/1/6.
//  Copyright (c) 2014年 戴 宏穎. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetTimeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIDatePicker *FromTimePicker;
@property (weak, nonatomic) IBOutlet UIDatePicker *ToTimePicker;
@property (weak, nonatomic) IBOutlet UIButton *SetTimeLabel;
- (void)setTimeLabel:(id)newTimeLabel;
@end
