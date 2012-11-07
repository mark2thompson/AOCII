//
//  AddEventViewController.m
//  week3planner
//
//  Created by Mark Thompson on 11/6/12.
//  Copyright (c) 2012 Mark Thompson. All rights reserved.
//

#import "AddEventViewController.h"
#import "ViewController.h"


@implementation AddEventViewController
@synthesize saveButton;
@synthesize closeKeyBut;
@synthesize theTextField;
@synthesize theDatePicker;
@synthesize delegate;


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
//-(IBAction)onChange:(id)sender{
//    UIDatePicker *picker = (UIDatePicker*)sender;
//    if (picker != nil){
//        NSDate *Date = [NSDate date];
//        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
//        [dateFormatter setDateFormat:@"MM-dd-yyyy HH:mm:SS a"];
//        // forces the user to choose a date and time in the futuer
//        picker.minimumDate=Date;
        
//        NSLog(@"date=%@", [Date description]);
  //  }
//}
// closes the keyboard 
-(IBAction)kbCLose:(id)sender{
    [textField resignFirstResponder];
}
//closes and saves the second view
-(IBAction)onSave:(id)sender{
    theDatePicker.minimumDate = [NSDate date];
    NSDate *Date = theDatePicker.date;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"MM-dd-yyyy HH:mm:SS a"];
    // forces the user to choose a date and time in the futuer
    //picker.minimumDate=Date;
    
    NSString *textFieldComplete = [[NSString alloc] initWithString: textField.text];
    NSString *dateStringComplete = [dateFormatter stringFromDate:Date];
    NSString *newString = [[NSString alloc] initWithFormat:@"%@: %@", textFieldComplete, dateStringComplete];
    [delegate addSaved:newString];
    [self dismissModalViewControllerAnimated:TRUE];
}

@end
