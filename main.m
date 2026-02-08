#include <Foundation/Foundation.h>
#include <stdio.h>

@interface myClass : NSObject {
@public
  char* myText;
}
- (instancetype)init:(char*)givenText;
- (void)print;
@end

@implementation myClass
- (instancetype)init:(char*)givenText {
  self = [super init];
  self->myText = givenText;
  return self;
}
- (void)print {
  printf("Hello %s!\n", myText);
}
@end

int main() {
  myClass* mainclass = [[myClass alloc] init:"Frank"];
  [mainclass print];
  printf("String: \"%s\"\n", mainclass->myText);
  mainclass->myText = "Gloup";
  [mainclass print];
}