//
//  BubblesViewController.h
//  Bubbles
//
//  Created by Rsg on 6/27/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BubblesViewController : UIViewController {
	IBOutlet UIScrollView *tbl;
	NSMutableArray *messages;
	IBOutlet UITextField *textfield;

}
@property (nonatomic, retain) UIScrollView *tbl;
@property (nonatomic, retain) NSMutableArray *messages;
-(IBAction) slideFrameUp;
-(IBAction) slideFrameDown;
-(IBAction) push:(id)sender; 
@end

