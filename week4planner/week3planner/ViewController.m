//
//  ViewController.m
//  week4planner
//
//  Created by Mark Thompson on 11/6/12.
//  Copyright (c) 2012 Mark Thompson. All rights reserved.
//

#import "ViewController.h"
#import "AddEventViewController.h"


@implementation ViewController

// adds the new string from the addeventviewcontroller
-(void)addSaved:(NSString*)theString{
    if([textView.text isEqualToString:@"All events go here!"]){
        textView.text = @"";
        textFromAdd = [NSMutableString stringWithString:textView.text];
        [textFromAdd appendString:theString];
        textView.text = textFromAdd;
    }
    else {
        textFromAdd = [NSMutableString stringWithString:textView.text];
        [textFromAdd appendString:theString];
        textView.text = textFromAdd;
    }
}
// the save button action - saves the text field text to the user defaults
-(IBAction)onSaveClick:(id)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (defaults != nil)
    {
        NSString *savedField = textView.text;
        [defaults setObject:savedField forKey:@"saved"];
    
        [defaults synchronize];
    }
}
// this is the onSwipe for the label that opens the second view 
-(void)onSwipe:(UISwipeGestureRecognizer*)recognizer
{
    if (recognizer.direction == UISwipeGestureRecognizerDirectionRight)
    {
        AddEventViewController *addEvent = [[AddEventViewController alloc] initWithNibName:@"AddEventViewController" bundle:nil];
        if (addEvent != nil) {
            addEvent.delegate = self;
            [addEvent setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
            [self presentModalViewController:addEvent animated:YES];
        }
        [textView resignFirstResponder];
    }

}
    
- (void)viewDidLoad
{
    // this pulls the saved information out of the defaults when the view loads
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (defaults != nil)
    {
        NSString *saveField = [defaults objectForKey:@"saved"];
        textView.text = saveField;
    }else{
        textView.text = @"All events go here!";
    }
       
    // this determines that the user has swiped right and adds the right swipe gesture to the label
    rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipe:)];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    [addSwipe addGestureRecognizer:rightSwipe];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
