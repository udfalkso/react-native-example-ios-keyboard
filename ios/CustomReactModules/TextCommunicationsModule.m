#import "RCTBridgeModule.h"
#import <UIKit/UIKit.h>
#import "KeyboardViewController.h"

@interface TextCommunicationsModule : NSObject <RCTBridgeModule>

@end

@implementation TextCommunicationsModule

@synthesize bridge = _bridge;

RCT_EXPORT_MODULE(TextCommunications);

RCT_EXPORT_METHOD(insertText:(NSString *)phrase)
{
  KeyboardViewController *extension = self.bridge.launchOptions[@"keyboardExtension"];
  [extension.textDocumentProxy insertText:phrase];
}

RCT_EXPORT_METHOD(advanceToNextInputMode)
{
  KeyboardViewController *extension = self.bridge.launchOptions[@"keyboardExtension"];
  [extension advanceToNextInputMode];
}

@end

