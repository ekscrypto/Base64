//
//  MF_Base64Additions.h
//  Base64 -- RFC 4648 compatible implementation
//  see http://www.ietf.org/rfc/rfc4648.txt for more details
//
//  Designed to be compiled with Automatic Reference Counting
//
//  Created by Dave Poirier on 2012-06-14.
//  Public Domain
//  Hosted at https://github.com/ekscrypto/Base64
//

#import <Foundation/Foundation.h>

@interface NSString (Base64Addition)
+(NSString *)stringFromBase64String:(NSString *)base64String;
+(NSString *)stringFromBase64UrlEncodedString:(NSString *)base64UrlEncodedString;
-(NSString *)base64String;
-(NSString *)base64UrlEncodedString;
@end

@interface NSData (Base64Addition)
+(NSData *)dataWithBase64String:(NSString *)base64String;
+(NSData *)dataWithBase64UrlEncodedString:(NSString *)base64UrlEncodedString;
-(NSString *)base64String;
-(NSString *)base64UrlEncodedString;
@end

@interface MF_Base64Codec : NSObject

/// Decode a Base64 encoded value to its NSData representation (Data in Swift)
/// @param base64String Base64 encoded string, padded or unpadded
/// @return decoded value or nil if Base64 string contained invalid characters
+(NSData *)dataFromBase64String:(NSString *)base64String;

/// Encodes a NSData object into its equivalent Base64 encoded representation
/// @param data NSData object to encode (or Data from Swift)
/// @return Base64 string representation, padded
+(NSString *)base64StringFromData:(NSData *)data;

/// Replaces characters of the Base64 string not usually accepted in URL query parameters. Strips padding characters (=), replaces + with -, replaces / with _
/// @param base64String Base64 string to modify
/// @return URLQuery safe representation of the Base64 string
+(NSString *)base64UrlEncodedStringFromBase64String:(NSString *)base64String;

/// Restores the original Base64 string characters from a URLQuery safe representation.  Replaces - with +, replaces _ with / and adding padding (=) characters back
/// @param base64UrlEncodedString URLQuery safe Base64 representation
/// @return Base64 representation
+(NSString *)base64StringFromBase64UrlEncodedString:(NSString *)base64UrlEncodedString;
@end
