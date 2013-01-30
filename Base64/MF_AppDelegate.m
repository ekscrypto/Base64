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

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    for( int i = 0; i < 300; i++ ) {
        NSData *randomDataBlock = [self randomDataBlock];
        NSString *base64Rep = [randomDataBlock base64String];
        NSData *revertedDataBlock = [MF_Base64Codec dataFromBase64String:base64Rep];
        if( [randomDataBlock isEqualToData:revertedDataBlock] ) {
            NSLog(@"SUCCESS: %@", base64Rep);
        } else {
            NSLog(@"FAILED: %@\noriginal data block: %@\n reverted data block: %@", base64Rep, randomDataBlock, revertedDataBlock);
        }
    }
}

-(NSData *)randomDataBlock
{
#define MaxRandomDataLength 64
    unsigned char bytes[MaxRandomDataLength];
    long dataLength = random() % 64;
    for(int i = 0; i < dataLength; i++ ) {
        bytes[i] = random() % 256;
    }
    
    return [[NSData alloc] initWithBytes:bytes length:dataLength];
}

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
