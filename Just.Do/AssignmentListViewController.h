//
//  AssignmentListViewController.h
//  Just.Do
//
//  Created by 戴宏穎 on 2014/1/13.
//  Copyright (c) 2014年 戴 宏穎. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@interface AssignmentListViewController : UIViewController
{
    NSMutableArray *list;
    NSArray *assignmentArray;
}

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (weak, nonatomic) IBOutlet UILabel *deadline1;
@property (weak, nonatomic) IBOutlet UILabel *priority1;
@property (weak, nonatomic) IBOutlet UILabel *title2;
@property (weak, nonatomic) IBOutlet UILabel *priority2;
@property (weak, nonatomic) IBOutlet UILabel *deadline2;
@property (weak, nonatomic) IBOutlet UILabel *title3;
@property (weak, nonatomic) IBOutlet UILabel *priority3;
@property (weak, nonatomic) IBOutlet UILabel *deadline3;
@property (weak, nonatomic) IBOutlet UILabel *title4;
@property (weak, nonatomic) IBOutlet UILabel *priority4;
@property (weak, nonatomic) IBOutlet UILabel *deadline4;
@property (weak, nonatomic) IBOutlet UILabel *title5;
@property (weak, nonatomic) IBOutlet UILabel *deadline5;
@property (weak, nonatomic) IBOutlet UILabel *priority5;
@property (weak, nonatomic) IBOutlet UIButton *check1;
@property (weak, nonatomic) IBOutlet UIButton *check2;
@property (weak, nonatomic) IBOutlet UIButton *check3;
@property (weak, nonatomic) IBOutlet UIButton *check4;
@property (weak, nonatomic) IBOutlet UIButton *check5;
@property (weak, nonatomic) IBOutlet UILabel *title1;
@end
