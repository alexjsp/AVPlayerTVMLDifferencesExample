//
//  ViewController.m
//  AVPlayerTest
//
//  Created by Alex Stevenson-Price on 22/12/2015.
//  Copyright © 2015 Homegrown Software. All rights reserved.
//

#import "ViewController.h"
#import <AVKit/AVKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)playWithAVPlayer:(id)sender
{
    AVPlayerItem *playerItem = [[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:@"https://devimages.apple.com.edgekey.net/streaming/examples/bipbop_4x3/gear1/prog_index.m3u8"]];

    AVPlayer *player = [[AVPlayer alloc] initWithPlayerItem:playerItem];

    AVPlayerViewController *playerVC = [[AVPlayerViewController alloc] init];
    playerVC.player = player;

    [self presentViewController:playerVC animated:NO completion:nil];

    [player play];
}

- (IBAction)playWithTVMLPlayer:(id)sender
{
    TVApplicationControllerContext *appControllerContext = [[TVApplicationControllerContext alloc] init];
    appControllerContext.javaScriptApplicationURL = [[NSBundle mainBundle] URLForResource:@"tvmlplayer" withExtension:@"js"];
    self.appController = [[TVApplicationController alloc] initWithContext:appControllerContext window:self.tvmlWindow delegate:nil];
    [self.appController evaluateInJavaScriptContext:^(JSContext * _Nonnull context) {
        void (^endPlayback)() = ^void() {
            [self.appController stop];
            self.appController = nil;
            self.tvmlWindow.hidden = YES;
            self.tvmlWindow = nil;
        };
        context[@"endPlayback"] = endPlayback;
    } completion:nil];
    [self.tvmlWindow makeKeyAndVisible];
}

- (UIWindow *)tvmlWindow
{
    if(!_tvmlWindow){
        _tvmlWindow = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    }
    return _tvmlWindow;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
