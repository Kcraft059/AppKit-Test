#include <Cocoa/Cocoa.h>

// Class declaration

@interface Application : NSApplication {
}

- (instancetype)init;
@end

@interface MainWindow : NSWindow {
}

- (instancetype)init;
@end

@interface AppDelegate : NSObject <NSApplicationDelegate> {
@private
  NSWindow* window;
}

- (void)applicationDidFinishLaunching:(NSNotification*)notification;
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication*)sender;
@end

@interface MainViewController : NSViewController {
}

- (void)loadView;
@end