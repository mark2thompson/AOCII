//
//  ViewController.h
//  week4planner
//
//  Created by Mark Thompson on 11/6/12.
//  Copyright (c) 2012 Mark Thompson. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol theDelegate <NSObject>

-(void)addSaved:(NSString*)theString;
-(void)onAddSwipe:(UISwipeGestureRecognizer*)recognizer;


@end

@interface ViewController : UIViewController <theDelegate>
{
    IBOutlet UITextView *textView;
    NSMutableString *textFromAdd;
    IBOutlet UILabel *addSwipe;
    UISwipeGestureRecognizer *leftSwipe;
    UISwipeGestureRecognizer *rightSwipe;
}

-(IBAction)onSaveClick:(id)sender;

@end
