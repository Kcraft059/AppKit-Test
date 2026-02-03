#include <AppKit/AppKit.h>
#include <Cocoa/Cocoa.h>
#include <objc/NSObject.h>

// Class declaration

@interface Window : NSWindow {
  NSTextField* label;
}
- (instancetype)init;
- (BOOL)windowShouldClose:(id)sender;
@end

@interface Application : NSApplication {
  NSObject<NSApplicationDelegate>* appdelegate;
}
- (instancetype)init;
@end