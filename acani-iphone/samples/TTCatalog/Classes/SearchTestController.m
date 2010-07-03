
#import "SearchTestController.h"
#import "MockDataSource.h"

@implementation SearchTestController

@synthesize delegate = _delegate;

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

- (id)init {
  if (self = [super init]) {
    _delegate = nil;
    
    self.title = @"Search Test";
    self.dataSource = [[[MockDataSource alloc] init] autorelease];
  }
  return self;
}

- (void)dealloc {
	[super dealloc];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// UIViewController
-(void)viewDidLoad{
	
	UIBarButtonItem *fooButton = [[UIBarButtonItem alloc] 
								  initWithTitle:@"Logout"
								  style:UIBarButtonItemStyleBordered 
								  target:self 
								  action:nil];
	self.navigationItem.rightBarButtonItem = fooButton;
	[fooButton release];
	
	
	

	
	
	//	UIBarButtonItem *heyButton = [[UIBarButtonItem alloc]
	//								  initWithTitle:@"Login"];
	//	self.navigationItem.backBarButtonItem = heyButton;
	//	[heyButton release];
}

- (void)loadView {
  [super loadView];

  TTTableViewController* searchController = [[[TTTableViewController alloc] init] autorelease];
  searchController.dataSource = [[[MockSearchDataSource alloc] initWithDuration:1.5] autorelease];
  self.searchViewController = searchController;
  self.tableView.tableHeaderView = _searchController.searchBar;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// TTTableViewController

- (void)didSelectObject:(id)object atIndexPath:(NSIndexPath*)indexPath {
  [_delegate searchTestController:self didSelectObject:object];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// TTSearchTextFieldDelegate

- (void)textField:(TTSearchTextField*)textField didSelectObject:(id)object {
  [_delegate searchTestController:self didSelectObject:object];
}

@end


//------------------------------------------------------------------

