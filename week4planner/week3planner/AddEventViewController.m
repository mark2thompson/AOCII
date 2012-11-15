//
//  AddEventViewController.m
//  week4planner
//
//  Created by Mark Thompson on 11/6/12.
//  Copyright (c) 2012 Mark Thompson. All rights reserved.
//

#import "AddEventViewController.h"
#import "ViewController.h"


@implementation AddEventViewController
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
    // fixed the minimumDate - this will only allow a user to select dates in the future
    theDatePicker.minimumDate = [NSDate date];
    
    // this determines that the user has swiped left and adds the left swipe gesture to the label
    leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSaveSwipe:)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [saveSwipe addGestureRecognizer:leftSwipe];
    [super viewDidLoad];
    
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
// this is the action that closes the keyboard
-(IBAction)kbCLose:(id)sender{
    [textField resignFirstResponder];
}

//closes and saves the second view with a swipe
-(void)onSaveSwipe:(UISwipeGestureRecognizer *)recognizer
{
    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        NSDate *Date = theDatePicker.date;
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateFormat:@"MM/dd/yyyy hh:mm a"];
        // forces the user to choose a date and time in the futuer
        //picker.minimumDate=Date;
        // just added the new event string... didnt see it until now in the project description
        NSString *newEvent = [[NSString alloc] initWithString:@"New Event: "];
        NSString *textFieldComplete = [[NSString alloc] initWithString: textField.text];
        NSString *dateStringComplete = [dateFormatter stringFromDate:Date];
        NSString *newString = [[NSString alloc] initWithFormat:@"%@%@\n%@\n\n", newEvent, textFieldComplete, dateStringComplete];
        [delegate addSaved:newString];
        [self dismissModalViewControllerAnimated:TRUE];
    }
}
@end
