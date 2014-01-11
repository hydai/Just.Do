//
//  AddClassViewController.h
//  Just.Do
//
//  Created by 戴宏穎 on 2013/12/23.
//  Copyright (c) 2013年 戴 宏穎. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddClassViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *ClassLabel;
@property (weak, nonatomic) IBOutlet UITextField *LocationLabel;
@property (weak, nonatomic) IBOutlet UIButton *SetTimeLabel;
@property (strong, nonatomic)        NSArray *hourArray;
@property (strong, nonatomic)        NSArray *minArray;

- (IBAction)setTimeLabelDone:(UIStoryboardSegue *)segue;
@end
