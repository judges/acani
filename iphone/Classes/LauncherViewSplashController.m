//
//  LauncherViewSplashController.m
//  TTCatalog
//
//  Created by Rodrigo Mazzilli on 10/7/09.
//  Modified by Michael Grinich on 6/2/10.
//

#import "LauncherViewSplashController.h"
#import "SearchTestController.h"
#import "MockDataSource.h"
#import "FBConnect.h"


@implementation LauncherViewSplashController

- (id)init {
	if (self = [super init]) {
		self.title = @"Acani";
	}
	return self;
}

- (void)dealloc {
	[super dealloc];
}


//-----------------
-(void)viewDidLoad{
	
	UIBarButtonItem *fooButton = [[UIBarButtonItem alloc] 
								  initWithTitle:@"Logout"
								  style:UIBarButtonItemStyleBordered 
								  target:self 
								  action:@selector(logout)];
	self.navigationItem.rightBarButtonItem = fooButton;
	[fooButton release];
	
	
	
	UIBarButtonItem *addButton = [[UIBarButtonItem alloc]
								  initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
								  target:self
								  action:@selector(openURLAction)];
	self.navigationItem.leftBarButtonItem = addButton;
	[addButton release];
	
	
//	UIBarButtonItem *heyButton = [[UIBarButtonItem alloc]
//								  initWithTitle:@"Login"];
//	self.navigationItem.backBarButtonItem = heyButton;
//	[heyButton release];
}
//--------------------------

-(void)openURLAction {
	
	//----------------------
	
	[[TTNavigator navigator] openURLAction:[[TTURLAction actionWithURLPath:@"tt://searchTest"] applyAnimated:YES]];
}	

-(void)logout {

[[TTNavigator navigator] openURLAction:[[TTURLAction actionWithURLPath:@"www.facebook.com"] applyAnimated:YES]];



}

- (void)loadView {
	[super loadView];
	_launcherView.frame = CGRectMake(0,50,320,390);
	_launcherView.backgroundColor = [UIColor whiteColor];
	_launcherView.delegate = self;
	_launcherView.columnCount = 3;
	
	_launcherView.pages = [NSArray arrayWithObjects:
						   [NSArray arrayWithObjects:
							[[[TTLauncherItem alloc] initWithTitle:@"Search"
															 image:@"bundle://Dropbox.png"
															   URL:@"tt://searchTest" canDelete:YES] autorelease],
							[[[TTLauncherItem alloc] initWithTitle:@"Photo"
															 image:@"bundle://IRC.png"
															   URL:@"tt://photoTest1" canDelete:YES] autorelease],
							[[[TTLauncherItem alloc] initWithTitle:@"Table"
															 image:@"bundle://Last.png"
															   URL:@"tt://tableItemTest" canDelete:YES] autorelease],
							[[[TTLauncherItem alloc] initWithTitle:@"Facebook"
															 image:@"bundle://facebook.png"
															   URL:@"www.facebook.com" canDelete:YES] autorelease],
							[[[TTLauncherItem alloc] initWithTitle:@"Game"
															 image:@"bundle://Dice.png"
															   URL:@"tt://activityTest" canDelete:YES] autorelease],
							[[[TTLauncherItem alloc] initWithTitle:@"Monkey"
															 image:@"bundle://Monkey.png"
															   URL:@"tt://photoTest2" canDelete:YES] autorelease],
							[[[TTLauncherItem alloc] initWithTitle:@"Mail"
															 image:@"bundle://Mail.png"
															   URL:@"tt://composerTest" canDelete:YES] autorelease],
							[[[TTLauncherItem alloc] initWithTitle:@"Wordbook"
															 image:@"bundle://Wordbook.png"
															   URL:@"tt://catalog" canDelete:YES] autorelease],
							[[[TTLauncherItem alloc] initWithTitle:@"Twitter"
															 image:@"bundle://twitter.png"
															   URL:@"www.twitter.com" canDelete:YES] autorelease],
							
							nil], 
						   nil
						   ];

	
	sBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0,0,320,40)];
    
	sBar.delegate = self;
	
	[self.view addSubview:sBar];
	
	
	
	ssBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0,375,320,50)];
	
	[self.view addSubview:ssBar];
	
	
	
	
	
	
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// TTLauncherViewDelegate

- (void)launcherView:(TTLauncherView*)launcher didSelectItem:(TTLauncherItem*)item {
	[[TTNavigator navigator] openURLAction:[TTURLAction actionWithURLPath:item.URL]];

}

- (void)launcherViewDidBeginEditing:(TTLauncherView*)launcher {
	[self.navigationItem setRightBarButtonItem:[[[UIBarButtonItem alloc] 
												 initWithBarButtonSystemItem:UIBarButtonSystemItemDone
												 target:_launcherView action:@selector(endEditing)] autorelease] animated:YES];
}

- (void)launcherViewDidEndEditing:(TTLauncherView*)launcher {
	[self.navigationItem setRightBarButtonItem:nil animated:YES];
}

@end


//------------------------------------------------------------


