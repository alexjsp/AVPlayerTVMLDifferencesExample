//
//  ViewController.h
//  AVPlayerTest
//
//  Created by Alex Stevenson-Price on 22/12/2015.
//

#import <UIKit/UIKit.h>

#import <TVMLKit/TVMLKit.h>

@interface ViewController : UIViewController

@property (strong,nonatomic) TVApplicationController *appController;
@property (strong,nonatomic) UIWindow *tvmlWindow;

@end

