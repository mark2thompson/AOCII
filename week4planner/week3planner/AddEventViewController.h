//
//  AddEventViewController.h
//  week4planner
//
//  Created by Mark Thompson on 11/6/12.
//  Copyright (c) 2012 Mark Thompson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "AddEventViewController.h"

@interface AddEventViewController : UIViewController
{
    IBOutlet UITextField *textField;
    IBOutlet UILabel *saveSwipe;
    UISwipeGestureRecognizer *leftSwipe;
    UISwipeGestureRecognizer *rightSwipe;
}
@property (retain, nonatomic) IBOutlet UIButton *closeKeyBut;
@property (retain, nonatomic) IBOutlet UIDatePicker *theDatePicker;
@property (retain, nonatomic) IBOutlet UITextField *theTextField;
@property (strong) id <theDelegate> delegate;
-(IBAction)kbCLose:(id)sender;
-(void)onSaveSwipe:(UISwipeGestureRecognizer*)recognizer;

@end
