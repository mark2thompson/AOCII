//
//  AddEventViewController.m
//  week3planner
//
//  Created by Mark Thompson on 11/6/12.
//  Copyright (c) 2012 Mark Thompson. All rights reserved.
//

#import "AddEventViewController.h"
#import "ViewController.h"

@interface AddEventViewController ()

@end

@implementation AddEventViewController



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
    // these are the notifications of what the keyboard is doing 
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)keyboardWillShow:(NSNotification *)notification{
    
}
-(void)keyboardWillHide:(NSNotification *)notification{

}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
// date function
-(IBAction)onChange:(id)sender{
    UIDatePicker *picker = (UIDatePicker*)sender;
    if (picker != nil){
        NSDate *Date = [NSDate date];
        // forces the user to choose a date and time in the futuer 
        picker.minimumDate=Date;
        NSLog(@"date=%@", [Date description]);
    }
}
// closes the keyboard 
-(IBAction)kbCLose:(id)sender{
    [textField resignFirstResponder];
}
//closes and saves the second view
-(IBAction)onSave:(id)sender{
    [self dismissModalViewControllerAnimated:TRUE];
}

@end
