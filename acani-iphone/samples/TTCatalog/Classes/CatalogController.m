#import "CatalogController.h"
#import "SearchTestController.h"
#import "MockDataSource.h"

@implementation CatalogController
//---------------------------------------------------------------------


///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

- (id)init {
  if (self = [super init]) {
    self.title = @"Acani";
    self.navigationItem.backBarButtonItem =
      [[[UIBarButtonItem alloc] initWithTitle:@"Acani" style:UIBarButtonItemStyleBordered
      target:nil action:nil] autorelease];
  }
  return self;
}



- (void)dealloc {
	[super dealloc];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// TTModelViewController
-(void)viewDidLoad{
	
		
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
	_launcherView.backgroundColor = [UIColor blackColor];
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
															   URL:@"https://graph.facebook.com" canDelete:YES] autorelease],
							[[[TTLauncherItem alloc] initWithTitle:@"Game"
															 image:@"bundle://Dice.png"
															   URL:@"tt://searchTest" canDelete:YES] autorelease],
							[[[TTLauncherItem alloc] initWithTitle:@"Monkey"
															 image:@"bundle://Monkey.png"
															   URL:@"tt://photoTest2"] autorelease],
							[[[TTLauncherItem alloc] initWithTitle:@"Mail"
															 image:@"bundle://Mail.png"
															   URL:@"tt://profile" canDelete:YES] autorelease],
							[[[TTLauncherItem alloc] initWithTitle:@"Wordbook"
															 image:@"bundle://Wordbook.png"
															   URL:@"tt://catalog" canDelete:YES] autorelease],
							[[[TTLauncherItem alloc] initWithTitle:@"Twitter"
															 image:@"bundle://twitter.png"
															   URL:@"www.twitter.com" canDelete:YES] autorelease],
							
							
							nil],
						   [NSArray arrayWithObjects:
							nil], 
						   nil
						   ];
	
	TTLauncherItem* item1 = [_launcherView itemWithURL:@"tt://searchTest"];
	item1.badgeNumber = 1;
	
	TTLauncherItem* item2 = [_launcherView itemWithURL:@"tt://photoTest1"];
	item2.badgeNumber = 2;
	TTLauncherItem* item3 = [_launcherView itemWithURL:@"tt://tableItemTest"];
	item3.badgeNumber = 3;
	TTLauncherItem* item4 = [_launcherView itemWithURL:@"www.facebook.com"];
	item4.badgeNumber = 4;
	TTLauncherItem* item5 = [_launcherView itemWithURL:@"tt://activityTest"];
	item5.badgeNumber = 5;
	TTLauncherItem* item6 = [_launcherView itemWithURL:@"tt://photoTest2"];
	item6.badgeNumber = 6;
	TTLauncherItem* item7 = [_launcherView itemWithURL:@"tt://composerTest"];
	item7.badgeNumber = 7;
	TTLauncherItem* item8 = [_launcherView itemWithURL:@"tt://catalog"];
	item8.badgeNumber = 8;
	TTLauncherItem* item9 = [_launcherView itemWithURL:@"www.twitter.com"];
	item9.badgeNumber = 9;
	
	sBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0,0,320,50)];
    
	sBar.delegate = self;
	
	[self.view addSubview:sBar];
	

	
    ssBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0,375,320,50)];
	
	[self.view addSubview:ssBar];

	
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
	
	
	//---------------------------------------------------------------------------------------------
	//initialize the two arrays; dataSource will be initialized and populated by appDelegate
	
	searchedData = [[NSMutableArray alloc]init];
	
	tableData = [[NSMutableArray alloc]init];
	
	[tableData addObjectsFromArray:dataSource];//on launch it should display all the records 
	
	
	
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




//------------------------------------------------------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	
	return 1;
	
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	//NSLog(@"contacts error in num of row");
	
	return [tableData count];
	
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *MyIdentifier = @"MyIdentifier";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	
	if (cell == nil) {
		
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:MyIdentifier] autorelease];
		
	}
	
	cell.text = [tableData objectAtIndex:indexPath.row];
	
	return cell;
	
}

#pragma mark UISearchBarDelegate


- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar

{
	
	// only show the status bar's cancel button while in edit mode
	
	sBar.showsCancelButton = YES;
	
	sBar.autocorrectionType = UITextAutocorrectionTypeNo;
	
	// flush the previous search content
	
	[tableData removeAllObjects];
	
}


- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar

{
	
	sBar.showsCancelButton = NO;
	
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText

{
	
	[tableData removeAllObjects];// remove all data that belongs to previous search
	
	if([searchText isEqualToString:@""]||searchText==nil){
		
		[myTableView reloadData];
		
		return;
		
	}
	
	NSInteger counter = 0;
	
	for(NSString *name in dataSource)
		
	{
		
		NSAutoreleasePool *pool = [[NSAutoreleasePool alloc]init];
		
		NSRange r = [name rangeOfString:searchText];
		
		if(r.location != NSNotFound)
			
		{
			
			if(r.location== 0)//that is we are checking only the start of the names.
				
			{
				
				[tableData addObject:name];
				
			}
			
		}
		
		counter++;
		
		[pool release];
		
	}
	
	[myTableView reloadData];
	
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar

{
	
	// if a valid search was entered but the user wanted to cancel, bring back the main list content
	
	[tableData removeAllObjects];
	
	[tableData addObjectsFromArray:dataSource];
	
	@try{
		
		[myTableView reloadData];
		
	}
	
	@catch(NSException *e){
		
	}
	
	[sBar resignFirstResponder];
	
	sBar.text = @"";
	
}


// called when Search (in our case "Done") button pressed

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar

{
	
	[searchBar resignFirstResponder];
	
}


//--------------------------------------------------------------------------------------------------------




@end