#import "MainViewController.h"
#import "QuartzViewController.h"
#import "QuartzLines.h"
#import "QuartzPolygons.h"
#import "QuartzCurves.h"
#import "QuartzImages.h"
#import "QuartzRendering.h"
#import "QuartzBlending.h"
#import "QuartzClipping.h"
#import "QuartzBlendingViewController.h"
#import "QuartzPolyViewController.h"
#import "QuartzGradientViewController.h"
#import "QuartzLineViewController.h"
#import "QuartzDashViewController.h"	

#define kCellIdentifier @"com.apple.samplecode.QuartzDemo.CellIdentifier"

@interface MainViewController()
-(void)addController:(QuartzViewController*)controller toSection:(NSString*)sectionName;
-(NSInteger)sectionCount;
-(NSInteger)sectionRowCount:(NSInteger)sectionIndex;
-(NSString*)sectionTitle:(NSInteger)sectionIndex;
-(QuartzViewController*)controllerAtIndexPath:(NSIndexPath*)path;
@end

@implementation MainViewController

-(void)addController:(QuartzViewController*)controller toSection:(NSString*)sectionName
{
	if(sections == nil)
	{
		sections = [[NSMutableDictionary alloc] init];
		sectionNames = [[NSMutableArray alloc] init];
	}
	NSMutableArray *list = [sections objectForKey:sectionName];
	if(list == nil)
	{
		list = [NSMutableArray array];
		[sections setValue:list forKey:sectionName];
		[sectionNames addObject:sectionName];
	}
	[list addObject:controller];
}

-(NSInteger)sectionCount
{
	return sections.count;
}

-(NSInteger)sectionRowCount:(NSInteger)sectionIndex;
{
	return [[sections objectForKey:[sectionNames objectAtIndex:sectionIndex]] count];
}

-(NSString*)sectionTitle:(NSInteger)sectionIndex
{
	return [sectionNames objectAtIndex:sectionIndex];
}

-(QuartzViewController*)controllerAtIndexPath:(NSIndexPath*)path
{
	return [[sections objectForKey:[sectionNames objectAtIndex:path.section]] objectAtIndex:path.row];
}

-(void)viewDidLoad
{
	[super viewDidLoad];

	
   
	// create our view controllers
	QuartzViewController *controller;

	// Line drawing demo
	controller = [[QuartzViewController alloc] initWithNibName:@"DemoView" viewClass:[QuartzLineView class]];
	controller.title = @"Lines(Demo)";
	controller.demoInfo = nil;
	[self addController:controller toSection:@"QuartzLines.m"];
	[controller release];
	//code
	controller = [[QuartzViewController alloc] initWithNibName:@"DemoView" viewClass:[QuartzLinePDFView class]];
	controller.title = @"Lines（Code)";
	controller.demoInfo = nil;
	[self addController:controller toSection:@"QuartzLines.m"];
	[controller release];
	
	
	// Showing the effects of line caps, joins & width
	controller = [[QuartzLineViewController alloc] init];
	controller.title = @"Caps, Joins & Width(Demo)";
	controller.demoInfo = nil;
	[self addController:controller toSection:@"QuartzLines.m"];
	[controller release];
	
	//code
	controller = [[QuartzViewController alloc] initWithNibName:@"DemoView" viewClass:[QuartzcapsPDFView class]];
	controller.title = @"Caps, Joins & Width(Code)";
	controller.demoInfo = nil;
	[self addController:controller toSection:@"QuartzLines.m"];
	[controller release];
	
	
	// Showing the effects of line dash patterns
	controller = [[QuartzDashViewController alloc] init];
	controller.title = @"Dash Patterns(Demo)";
	controller.demoInfo = nil;
	
	[self addController:controller toSection:@"QuartzLines.m"];
	[controller release];
	
	
	//code
	controller = [[QuartzViewController alloc] initWithNibName:@"DemoView" viewClass:[QuartzDashViewPDFView class]];
	controller.title = @"Dash Patterns(Code)";
	controller.demoInfo = nil;
	[self addController:controller toSection:@"QuartzLines.m"];
	[controller release];


	// Rectangle drawing demo
	controller = [[QuartzViewController alloc] initWithNibName:@"DemoView" viewClass:[QuartzRectView class]];
	controller.title = @"Rectangles(Demo)";
	controller.demoInfo = nil;
	[self addController:controller toSection:@"QuartzPolygons.m"];
	[controller release];

	//code
	controller = [[QuartzViewController alloc] initWithNibName:@"DemoView" viewClass:[QuartzRectPDFView class]];
	controller.title = @"Rectangles(Code)";
	controller.demoInfo = nil;
	[self addController:controller toSection:@"QuartzPolygons.m"];
	[controller release];
	
	// Polygon drawing demo
	controller = [[QuartzPolyViewController alloc] init];
	controller.title = @"Polygons(Demo)";
	controller.demoInfo = nil;
	[self addController:controller toSection:@"QuartzPolygons.m"];
	[controller release];
	
	//code
	controller = [[QuartzViewController alloc] initWithNibName:@"DemoView" viewClass:[QuartzPolyViewPDFView class]];
	controller.title = @"Polygons(Code)";
	controller.demoInfo = nil;
	[self addController:controller toSection:@"QuartzPolygons.m"];
	[controller release];
	

	// Ellipses, arcs, and as a bonus round-rects!
	controller = [[QuartzViewController alloc] initWithNibName:@"DemoView" viewClass:[QuartzEllipseArcView class]];
	controller.title = @"Ellipses & Arcs(Demo)";
	controller.demoInfo = nil;
	[self addController:controller toSection:@"QuartzCurves.m"];
	[controller release];
	
	// code
	controller = [[QuartzViewController alloc] initWithNibName:@"DemoView" viewClass:[QuartzEllipseArcPDFView class]];
	controller.title = @"Ellipses & Arcs(Code)";
	controller.demoInfo = nil;
	[self addController:controller toSection:@"QuartzCurves.m"];
	[controller release];

	// Bezier and Quadratic curves
	controller = [[QuartzViewController alloc] initWithNibName:@"DemoView" viewClass:[QuartzBezierView class]];
	controller.title = @"Beziers & Quadratics(Demo)";
	controller.demoInfo = nil;
	[self addController:controller toSection:@"QuartzCurves.m"];
	[controller release];
	
	
	//code
	controller = [[QuartzViewController alloc] initWithNibName:@"DemoView" viewClass:[QuartzBezierPDFView class]];
	controller.title = @"Beziers & Quadratics(Code)";
	controller.demoInfo = nil;
	[self addController:controller toSection:@"QuartzCurves.m"];
	[controller release];

	// Images (drawing once and tiling an image)
	controller = [[QuartzViewController alloc] initWithNibName:@"DemoView" viewClass:[QuartzImageView class]];
	controller.title = @"Images & Tiling(Demo)";
	controller.demoInfo = nil;
	[self addController:controller toSection:@"QuartzImages.m"];
	[controller release];
	
	
	//code
	controller = [[QuartzViewController alloc] initWithNibName:@"DemoView" viewClass:[QuartzImagePDFView class]];
	controller.title = @"Images & Tiling(Code)";
	controller.demoInfo = nil;
	[self addController:controller toSection:@"QuartzImages.m"];
	[controller release];
	


	// Text
	controller = [[QuartzViewController alloc] initWithNibName:@"DemoView" viewClass:[QuartzTextView class]];
	controller.title = @"Text(Demo)";
	controller.demoInfo = nil;
	[self addController:controller toSection:@"QuartzImages.m"];
	[controller release];
	
	//code
	controller = [[QuartzViewController alloc] initWithNibName:@"DemoView" viewClass:[QuartzTextPDFView class]];
	controller.title = @"Text(Code)";
	controller.demoInfo = nil;
	[self addController:controller toSection:@"QuartzImages.m"];
	[controller release];

	// Drawing Patterns
	controller = [[QuartzViewController alloc] initWithNibName:@"DemoView" viewClass:[QuartzPatternView class]];
	controller.title = @"Patterns(Demo)";
	controller.demoInfo = nil;
	[self addController:controller toSection:@"QuartzRendering.m"];
	[controller release];
	
	//code
	controller = [[QuartzViewController alloc] initWithNibName:@"DemoView" viewClass:[QuartzPatternPDFView class]];
	controller.title = @"Patterns(Code)";
	controller.demoInfo = nil;
	[self addController:controller toSection:@"QuartzRendering.m"];
	[controller release];


	// Drawing Linear and Radial Gradients
	controller = [[QuartzGradientViewController alloc] init];
	controller.title = @"Gradients(Demo)";
	controller.demoInfo =nil;
	[self addController:controller toSection:@"QuartzRendering.m"];
	[controller release];
	
	//code
	controller = [[QuartzViewController alloc] initWithNibName:@"DemoView" viewClass:[QuartzGradientViewPDFView class]];
	controller.title = @"Gradients(Code)";
	controller.demoInfo = nil;
	[self addController:controller toSection:@"QuartzRendering.m"];
	[controller release];
	
	// Blending Demo
	controller = [[QuartzBlendingViewController alloc] init];
	controller.title = @"Blending Modes(Demo)";
	controller.demoInfo = nil;
	[self addController:controller toSection:@"QuartzBlending.m"];
	[controller release];
	
	//code
	controller = [[QuartzViewController alloc] initWithNibName:@"DemoView" viewClass:[QuartzBlendingPDFView class]];
	controller.title = @"Blending Modes(Code)";
	controller.demoInfo = nil;
	[self addController:controller toSection:@"QuartzBlending.m"];
	[controller release];

	// Clipping Demo
	controller = [[QuartzViewController alloc] initWithNibName:@"DemoView" viewClass:[QuartzClippingView class]];
	controller.title = @"Clipping(Demo)";
	controller.demoInfo = nil;
	[self addController:controller toSection:@"QuartzClipping.m"];
	[controller release];

	
	//code
	controller = [[QuartzViewController alloc] initWithNibName:@"DemoView" viewClass:[QuartzClippingPDFView class]];
	controller.title = @"Clipping(Code)";
	controller.demoInfo = nil;
	[self addController:controller toSection:@"QuartzClipping.m"];
	[controller release];
	
	// Masking Demo
	controller = [[QuartzViewController alloc] initWithNibName:@"DemoView" viewClass:[QuartzMaskingView class]];
	controller.title = @"Masking(Demo)";
	controller.demoInfo = nil;
	[self addController:controller toSection:@"QuartzClipping.m"];
	[controller release];
	
	//code
	controller = [[QuartzViewController alloc] initWithNibName:@"DemoView" viewClass:[QuartzMaskingPDFView class]];
	controller.title = @"Masking(Code)";
	controller.demoInfo = nil;
	[self addController:controller toSection:@"QuartzClipping.m"];
	[controller release];
}

- (void)dealloc
{
	[sections release];
	[sectionNames release];
	[super dealloc];
}

#pragma mark UIViewController delegate

- (void)viewWillAppear:(BOOL)animated
{
	// this UIViewController is about to appear
	// make sure we remove the current selection from our table view
	NSIndexPath *tableSelection = [self.tableView indexPathForSelectedRow];
	[self.tableView deselectRowAtIndexPath:tableSelection animated:NO];
	// Set the navbar style to its default color for the list view.
	self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
	// Set the status bar to its default color for the list view.
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
}

#pragma mark UITableView delegate methods

// the table's selection has changed, switch to that item's UIViewController
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	QuartzViewController *targetViewController = [self controllerAtIndexPath:indexPath];
	[[self navigationController] pushViewController:targetViewController animated:YES];
}

#pragma mark UITableView data source methods

// tell our table how many sections or groups it will have (always 1(our case)
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return [self sectionCount];
}

// tell our table how many rows it will have,(our case the size of our menuList
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self sectionRowCount:section];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return [self sectionTitle:section];
}

// tell our table what kind of cell to use and its title for the given row
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
	if (cell == nil)
	{
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kCellIdentifier] autorelease];
	}
	QuartzViewController *vc = [self controllerAtIndexPath:indexPath];
	cell.textLabel.text = vc.title;
	cell.detailTextLabel.text = vc.demoInfo;
	cell.detailTextLabel.adjustsFontSizeToFitWidth = YES;
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

	return cell;
}

@end

