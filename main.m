#include <Foundation/Foundation.h>

@interface myClass: NSObject {
  NSString* myText;
}
- (instancetype)init:(NSString*)givenText;
- (void)mymethod;
@end

@implementation myClass
- (instancetype)init:(NSString*)givenText {
  self = [super init];
  myText = givenText;
  return self;
}
- (void)mymethod {
  printf("Hello %s!\n", [myText cStringUsingEncoding:NSUTF8StringEncoding]);
}
@end

int main() {
  myClass* mainclass = [[myClass alloc] init:@"World"];
  [mainclass mymethod];
}