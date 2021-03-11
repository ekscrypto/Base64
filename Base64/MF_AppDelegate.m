//
//  MF_AppDelegate.m
//  Base64
//
//  Created by Dave Poirier on 2012-06-14.
//  Public Domain
//

#import "MF_AppDelegate.h"
#import "MF_Base64Additions.h"

@implementation MF_AppDelegate

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

-(IBAction)encode:(id)sender
{
    NSString *raw = self.textview.string;
    NSString *encoded = [raw base64String];
    self.textview.string = encoded;
}

-(IBAction)decode:(id)sender
{
    NSString *encoded = self.textview.string;
    NSData *data = [NSData dataWithBase64String:encoded];
    NSString *raw = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    if( raw )
    {
        self.textview.string = raw;
    }
    else
    {
        self.textview.string = [NSString stringWithFormat:@"WARNING: data could not be converted to a NSString, dumping decoded binary data: %@", data];
    }
}

-(IBAction)encodeBase64UrlEncoding:(id)sender
{
    NSString *raw = self.textview.string;
    NSString *encoded = [raw base64UrlEncodedString];
    self.textview.string = encoded;
}

-(IBAction)decodeBase64UrlEncoding:(id)sender
{
    NSString *encoded = self.textview.string;
    NSData *data = [NSData dataWithBase64UrlEncodedString:encoded];
    NSString *raw = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    if( raw )
    {
        self.textview.string = raw;
    }
    else
    {
        self.textview.string = [NSString stringWithFormat:@"WARNING: data could not be converted to a NSString, dumping decoded binary data: %@", data];
    }
}

@end
