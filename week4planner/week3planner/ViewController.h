//
//  ViewController.h
//  week3planner
//
//  Created by Mark Thompson on 11/6/12.
//  Copyright (c) 2012 Mark Thompson. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol theDelegate <NSObject>

-(void)addSaved:(NSString*)theString;

@end

@interface ViewController : UIViewController <theDelegate>
{
    IBOutlet UITextView *textView;
    NSMutableString *textFromAdd;
}

-(IBAction)onClick:(id)sender;

@end
