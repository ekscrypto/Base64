//
//  Base64ObjcTests.swift
//  Base64
//
//  Created by Dave Poirier on 2022-02-08.
//  Dual licensed under the Public Domain and MIT License

@import XCTest;
@import Base64;

@interface Base64ObjcTests: XCTestCase
@end

@implementation Base64ObjcTests

// The values in this test are found in Section 10 of the Base64 RFC
// https://tools.ietf.org/html/rfc4648#section-10
-(void)testRFCValues
{
    NSDictionary *vectors = @{@"": @"",
                              @"f": @"Zg==",
                              @"fo": @"Zm8=",
                              @"foo": @"Zm9v",
                              @"foob": @"Zm9vYg==",
                              @"fooba": @"Zm9vYmE=",
                              @"foobar": @"Zm9vYmFy"};
    [self _testEncodingWithVectors: vectors];
    [self _testDecodingWithVectors: vectors];
}

-(void)testUnpaddedRFCValues
{
    NSDictionary *vectors = @{@"": @"",
                              @"f": @"Zg",
                              @"fo": @"Zm8",
                              @"foo": @"Zm9v",
                              @"foob": @"Zm9vYg",
                              @"fooba": @"Zm9vYmE",
                              @"foobar": @"Zm9vYmFy"};
    [self _testDecodingWithVectors: vectors];
}

- (void)_testEncodingWithVectors:(NSDictionary *)vectors
{
    for (NSString *plaintext in vectors) {
        NSString *ciphertext = vectors[plaintext];

        NSString *encryptedPlaintext = [[plaintext dataUsingEncoding:NSUTF8StringEncoding] base64String];
        XCTAssertEqualObjects(encryptedPlaintext, ciphertext, @"");
    }
}

- (void)_testDecodingWithVectors:(NSDictionary *)vectors
{
    for (NSString *plaintext in vectors) {
        NSString *ciphertext = vectors[plaintext];

        NSString *decryptedCiphertext = [[NSString alloc] initWithData:[NSData dataWithBase64String:ciphertext] encoding:NSUTF8StringEncoding];
        XCTAssertEqualObjects(decryptedCiphertext, plaintext, @"");
    }
}

- (void)testRandomData
{
    for (int i = 0; i < 300; i++) {
        NSData *randomDataBlock = [self randomDataBlock];
        NSString *base64Rep = [randomDataBlock base64String];
        NSData *revertedDataBlock = [NSData dataWithBase64String:base64Rep];
        XCTAssertTrue([randomDataBlock isEqualToData:revertedDataBlock],
                      @"%@\n    original data block: %@\n    reverted data block: %@",
                      base64Rep, randomDataBlock, revertedDataBlock);
    }
}

- (NSData *)randomDataBlock
{
#define MaxRandomDataLength 64
    unsigned char bytes[MaxRandomDataLength];
    long dataLength = arc4random() % 64;
    for (int i = 0; i < dataLength; i++) {
        bytes[i] = (unsigned char)(arc4random() % 256);
    }

    return [[NSData alloc] initWithBytes:bytes length:dataLength];
}

@end
