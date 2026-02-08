#include <main.h>

@implementation Application
- (instancetype)init {
  self = [super init];
  [self setDelegate: [[AppDelegate alloc] init]];
  return self;
}
@end

int main(int argc, char* argv[]) {
  @autoreleasepool {
    NSApplication* App = [Application sharedApplication];
    [App run];
  }
  return 0;
}