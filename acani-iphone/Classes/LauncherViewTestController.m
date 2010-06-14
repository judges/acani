#import "LauncherViewTestController.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation LauncherViewTestController
- (id)init {
	if (self = [super init]) {
		self.title = @"Acani";
	}
	return self;
}

- (void)dealloc {
	[super dealloc];
}




- (void)loadView {
	
	CGRect buttonRect = CGRectMake(0, 0, 20, 20);
	//allocate the view
	self.view = [[UIView alloc] initWithFrame:buttonRect];
	
	//set the view's background color
	self.view.backgroundColor = [UIColor whiteColor];
	
	//create the button
	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	
	//set the position of the button
	button.frame = CGRectMake(200, 400, 100, 30);
	
	//set the button's title
	[button setTitle:@"Click Me!" forState:UIControlStateNormal];
	
	//add the button to the view
	[self.view addSubview:button];
	
	
}


@end





