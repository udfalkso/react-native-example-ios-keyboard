//
//  KeyboardViewController.m
//  RN Sample Keyboard
//
//  Created by Udi on 3/5/16.
//  Copyright © 2016 MK Tech. All rights reserved.
//

#import "KeyboardViewController.h"
#import "RCTRootView.h"
#import "RCTBridge.h"


@interface KeyboardViewController ()
  @property (nonatomic, strong) UIButton *nextKeyboardButton;
  @property (nonatomic) RCTRootView *rootView;
  @property (nonatomic) UIView *loadingView;
@end


@implementation KeyboardViewController

- (void)updateViewConstraints {
  [super updateViewConstraints];
  
  if (self.rootView) {
    NSLog(@"chaning root view dimensions");
    self.rootView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
  }
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.loadingView = [[UIView alloc] init];
  [self.view addSubview:self.loadingView];
  self.loadingView.frame = CGRectMake(0, 0, self.view.frame.size.width, 100 /*self.view.frame.size.height*/);
  NSLog(@"Added loading view");

  /*
   * Next Button
   */
  //Seems to have to be included for some behaviors to work properly
  self.nextKeyboardButton = [UIButton buttonWithType:UIButtonTypeSystem];
  [self.nextKeyboardButton setTitle:NSLocalizedString(@"Initializing...", @"Title for 'Next Keyboard' button") forState:UIControlStateNormal];
  [self.nextKeyboardButton sizeToFit];
  self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = NO;
  [self.nextKeyboardButton addTarget:self action:@selector(advanceToNextInputMode) forControlEvents:UIControlEventTouchUpInside];
  [self.loadingView addSubview:self.nextKeyboardButton];
  //self.nextKeyboardButton.hidden = true;
   
  NSLayoutConstraint *nextKeyboardButtonLeftSideConstraint = [NSLayoutConstraint constraintWithItem:self.nextKeyboardButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0];
  NSLayoutConstraint *nextKeyboardButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:self.nextKeyboardButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
  [self.view addConstraints:@[nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint]];
   /*
    * END Next Button
    */
  
  
  //Use this for development!
  NSURL *jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.ios.bundle?platform=ios&dev=true"];
  
  //Use this for production release!
  //NSURL *jsCodeLocation = [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
  
  dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * .05);
  dispatch_after(delay, dispatch_get_main_queue(), ^(void){
    RCTBridge *myBridge = [[RCTBridge alloc] initWithBundleURL:jsCodeLocation moduleProvider:nil launchOptions:@{@"keyboardExtension": self}];
    self.rootView = [[RCTRootView alloc] initWithBridge:myBridge moduleName:@"RNKeyboardSampleApp" initialProperties:nil ];
    [self.view addSubview:self.rootView];
    NSLog(@"Added root view");
    [self updateViewConstraints];
    NSLog(@"Added root view 2");
  });
  
  [self updateViewConstraints];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated
}

-(void)viewDidAppear:(BOOL)animated
{
  [self updateViewConstraints];
}

-(void)viewDidLayoutSubviews:(BOOL)animated
{
  [self updateViewConstraints];
}

@end
