//
//  ViewController.m
//  week3planner
//
//  Created by Mark Thompson on 11/6/12.
//  Copyright (c) 2012 Mark Thompson. All rights reserved.
//

#import "ViewController.h"
#import "AddEventViewController.h"


@implementation ViewController

 //setting this up to open the second view
-(IBAction)onClick:(id)sender{
    AddEventViewController *addEvent = [[AddEventViewController alloc] initWithNibName:@"AddEventViewController" bundle:nil];
    if (addEvent != nil) {
        addEvent.delegate = self;
        [self presentModalViewController:addEvent animated:true];
    }
    [textView resignFirstResponder];
  
}
// adds the new string from the addeventviewcontroller
-(void)addSaved:(NSString*)theString{
    if([textView.text isEqualToString:@"All events go here!"]){
        textView.text = @"";
        textFromAdd = [NSMutableString stringWithString:textView.text];
        [textFromAdd appendString:theString];
        textView.text = textFromAdd;
    }
}

- (void)viewDidLoad
{
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
