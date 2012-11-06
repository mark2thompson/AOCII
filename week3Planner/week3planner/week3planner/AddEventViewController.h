//
//  AddEventViewController.h
//  week3planner
//
//  Created by Mark Thompson on 11/6/12.
//  Copyright (c) 2012 Mark Thompson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddEventViewController : UIViewController
{
    IBOutlet UITextField *textField;

}
-(IBAction)onChange:(id)sender;
-(IBAction)onSave:(id)sender;
-(IBAction)kbCLose:(id)sender;
@end
