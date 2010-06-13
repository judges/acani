#import "CatalogController.h"

@implementation CatalogController

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

- (id)init {
  if (self = [super init]) {
    self.title = @"Three20 Catalog";
    self.navigationItem.backBarButtonItem =
      [[[UIBarButtonItem alloc] initWithTitle:@"Catalog" style:UIBarButtonItemStyleBordered
      target:nil action:nil] autorelease];

    self.tableViewStyle = UITableViewStyleGrouped;
  }
  return self;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// TTModelViewController

- (void)createModel {
  self.dataSource = [TTSectionedDataSource dataSourceWithObjects:


	[TTTableTextItem itemWithText:@"Launcher w/ Splash" URL:@"tt://launcherSplashTest"],					 

    nil];
}

@end
