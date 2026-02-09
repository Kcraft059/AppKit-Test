#include <main.h>

@implementation MainWindow
- (instancetype)init {
  self = [super initWithContentRect:(NSRect) { (CGPoint){.x = 0, .y = 0}, (CGSize){.width = 970, .height = 640} }
                          styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable |
                                    NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable |
                                    NSWindowStyleMaskFullSizeContentView
                            backing:NSBackingStoreBuffered
                              defer:NO];

  self.backgroundColor = NSColor.clearColor;
  self.opaque = NO;
  self.titlebarAppearsTransparent = YES;
  self.title = @"NSGlassView";

  return self;
}
@end

@implementation MainViewController
- (void)loadView {
  NSView* view = [[NSView alloc] initWithFrame:(NSRect){(CGPoint){.x = 0, .y = 0}, (CGSize){.width = 970, .height = 640}}];
  view.wantsLayer = YES;

  NSTextField* label = [NSTextField labelWithString:@"Hello World!"];
  label.translatesAutoresizingMaskIntoConstraints = NO;
  [view addSubview:label];

  [NSLayoutConstraint activateConstraints:@[ [label.centerXAnchor constraintEqualToAnchor:view.centerXAnchor],
                                             [label.centerYAnchor constraintEqualToAnchor:view.centerYAnchor] ]];

  NSGlassEffectView* glassView = [[NSGlassEffectView alloc] init];
  glassView.translatesAutoresizingMaskIntoConstraints = NO;
  glassView.style = NSGlassEffectViewStyleRegular;
  //glassView.tintColor = [NSColor colorWithSRGBRed:0 green:0 blue:0 alpha:0.1];

  [view addSubview:glassView positioned:NSWindowBelow relativeTo:label];

  [NSLayoutConstraint activateConstraints:@[ [glassView.leadingAnchor constraintEqualToAnchor:view.leadingAnchor],
                                             [glassView.trailingAnchor constraintEqualToAnchor:view.trailingAnchor],
                                             [glassView.topAnchor constraintEqualToAnchor:view.topAnchor],
                                             [glassView.bottomAnchor constraintEqualToAnchor:view.bottomAnchor] ]];

  self.view = view;
}
@end