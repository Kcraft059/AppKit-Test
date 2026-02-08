#include <main.h>
#include <objc/objc.h>

@implementation AppDelegate
- (void)applicationDidFinishLaunching:(NSNotification*)notification {
  window = [[MainWindow alloc] init];
  NSViewController* view = [[MainViewController alloc] init];

  [window setContentViewController:view];

  [window center];
  [window makeKeyAndOrderFront:Nil];
}
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication*)sender {
  return YES;
}
@end