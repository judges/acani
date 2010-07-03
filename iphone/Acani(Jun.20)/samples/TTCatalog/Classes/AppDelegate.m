#import "AppDelegate.h"
#import "CatalogController.h"
#import "PhotoTest1Controller.h"
#import "PhotoTest2Controller.h"
#import "SearchTestController.h"
#import "ProfileController.h"




//---------------------------------------------------------------------------



@implementation AppDelegate


// UIApplicationDelegate

- (void)applicationDidFinishLaunching:(UIApplication*)application {
  TTNavigator* navigator = [TTNavigator navigator];
  navigator.supportsShakeToReload = YES;
  navigator.persistenceMode = TTNavigatorPersistenceModeAll;
	

  TTURLMap* map = navigator.URLMap;
  [map from:@"*" toViewController:[TTWebController class]];
  [map from:@"tt://catalog" toViewController:[CatalogController class]];
  [map from:@"tt://photoTest1" toViewController:[PhotoTest1Controller class]];
  [map from:@"tt://photoTest2" toViewController:[PhotoTest2Controller class]];
  [map from:@"tt://searchTest" toViewController:[SearchTestController class]]; 
  [map from:@"tt://profile" toViewController:[ProfileController class]]; 

	
	
  if (![navigator restoreViewControllers]) {
    [navigator openURLAction:[TTURLAction actionWithURLPath:@"tt://catalog"]];
  }
}

- (BOOL)application:(UIApplication*)application handleOpenURL:(NSURL*)URL {
  [[TTNavigator navigator] openURLAction:[TTURLAction actionWithURLPath:URL.absoluteString]];
  return YES;
}

//-------------------------------------------------------------------------




@end
