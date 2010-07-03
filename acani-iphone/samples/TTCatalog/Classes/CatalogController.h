#import <Three20/Three20.h>
#import <UIKit/UIKit.h>

@interface CatalogController : TTLauncherViewController <TTLauncherViewDelegate>{
	UISearchBar *sBar;//search bar
	UISearchBar *ssBar;
	//-------------------------------------------------------------------------------------------------	
	UITableView  *myTableView;
	
	NSMutableArray *dataSource; //will be storing all the data
	
	NSMutableArray *tableData;//will be storing data that will be displayed in table
	
	NSMutableArray *searchedData;//will be storing data matching with the search string
	
	//--------------------------------------------------------------------------------------

}

@property(nonatomic,retain)NSMutableArray *dataSource;
//----------------------------------------------------------------------------


@end

//-------------------------------


