#include <main.h>

@implementation Application
- (instancetype)init {
  self = [super init];
  self.delegate = [[AppDelegate alloc] init];
  return self;
}
@end

int main() {
  @autoreleasepool {
    NSApplication* App = [Application sharedApplication];
    [App run];
  }
  return 0;
}