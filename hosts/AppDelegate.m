//
//  AppDelegate.m
//  hosts
//
//  Created by Jessica Rudder on 10/16/15.
//  Copyright © 2015 Jessica Rudder. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)updateHostFile:(id)sender {
    // path to the installHosts shell script within project
    NSString *shellScriptPath = [[NSBundle mainBundle] pathForResource:@"installHosts" ofType:@"sh"];

    // prepend bash path to run installHosts shell script
    NSString *shellScriptRunCommand = [NSString stringWithFormat: @"\"/bin/bash %@\"", shellScriptPath];
    
    // build AppleScript command for running shell script with permissions
    NSString *appleScriptCommand = [[NSString alloc] initWithFormat:@"do shell script %@ with administrator privileges", shellScriptRunCommand];
    
    // type to AppleScript
    NSAppleScript *shellScript;
    shellScript = [[NSAppleScript alloc] initWithSource:appleScriptCommand];
    
    // run script
    NSDictionary *errorsDictionary = NULL;
    [shellScript executeAndReturnError:&errorsDictionary];
}
@end
