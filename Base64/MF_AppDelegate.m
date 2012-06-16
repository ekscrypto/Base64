//
//  MF_AppDelegate.m
//  Base64
//
//  Created by Dave Poirier on 12-06-14.
//  Public Domain
//

#import "MF_AppDelegate.h"
#import "MF_Base64Additions.h"

@implementation MF_AppDelegate

@synthesize window = _window;
@synthesize textField = _textField;

//- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
//{
//}

-(void)encode:(id)sender
{
    NSString *raw = [_textField stringValue];
    NSString *encoded = [raw base64String];
    [_textField setStringValue:encoded];
}

-(void)decode:(id)sender
{
    NSString *encoded = [_textField stringValue];
    NSData *data = [NSData dataWithBase64String:encoded];
    NSString *raw = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    [_textField setStringValue:raw];
}

@end
