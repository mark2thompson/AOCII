//
//  ViewController.h
//  week2calc
//
//  Created by Mark Thompson on 11/1/12.
//  Copyright (c) 2012 Mark Thompson. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController {

    float result;
    IBOutlet UITextField * calculatorScreen;
    int currentOperation;
    float currentNumber;
    IBOutlet UISwitch *onOffSwitch;
    
}
-(IBAction)buttonDigitPressed:(id)sender;
-(IBAction)buttonOperationPressed:(id)sender;
-(IBAction)cancelOperation;
-(IBAction)changeBGseg:(id)sender;
-(IBAction)secondViewClick:(id)sender;
@end
