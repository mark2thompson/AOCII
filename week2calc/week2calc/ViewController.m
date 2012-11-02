//
//  ViewController.m
//  week2calc
//
//  Created by Mark Thompson on 11/1/12.
//  Copyright (c) 2012 Mark Thompson. All rights reserved.
//

#import "ViewController.h"
#import "infoViewController.h"

@interface ViewController ()

@end

@implementation ViewController
// this is the action for when a digit is pressed... uses the tags to detirmine the number
-(IBAction)buttonDigitPressed:(id)sender {
    currentNumber = currentNumber *10 + (float)[sender tag];
    calculatorScreen.text = [NSString stringWithFormat:@"%f",currentNumber];
}
// this is the action for when an operation button is pressed... determines between equals and plus
-(IBAction)buttonOperationPressed:(id)sender {
    if (currentOperation == 0) result = currentNumber;
    else {
        switch (currentOperation) {
            case 1:
                result = result + currentNumber;
                break;
        }
    }
    currentNumber = 0;
    calculatorScreen.text = [NSString stringWithFormat:@"%f", result];
    if ([sender tag] ==0 ) result=0;
    currentOperation = [sender tag];
}
//this clears all inputs and starts back at 0 
-(IBAction)cancelOperation{
    currentNumber = 0;
    calculatorScreen.text = @"0";
    currentOperation = 0;
}
// this opens the second view
-(IBAction)secondViewClick:(id)sender{
    infoViewController *viewController = [[infoViewController alloc]
                                           initWithNibName:@"infoView" bundle:nil];
    if (viewController !=nil){
        [self presentModalViewController:viewController animated:TRUE];
    }
    
}

// this is the BG segment switch action and function
-(IBAction)changeBGseg:(id)sender{
    UISegmentedControl *BGController = (UISegmentedControl *)sender;
    if (BGController !=nil)
    {
        int segValue = BGController.selectedSegmentIndex;
        // this uses the segment controllers index to determine what color I am want for the background
        switch (segValue){
            case 0:
                self.view.backgroundColor = [UIColor whiteColor];
                break;
                
            case 1:
                self.view.backgroundColor = [UIColor blueColor];
                break;
                
            case 2:
                self.view.backgroundColor = [UIColor greenColor];
                break;
                
        }
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
