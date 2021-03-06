[![CI Status](https://travis-ci.org/ekscrypto/Base64.svg?branch=master)](https://github.com/ekscrypto/Base64)

Base64 Additions for Objective-C on Mac OS X and iOS
=======

WARNING: This code is no longer required, base64 comes with all recent versions of macOS, iOS, iPadOS, watchOS and tvOS. Performance metrics below were valid for comparison against the provided libraries in 2012 and may not reflect current performance.  If in doubt, use the system provided functions.


### Usage: Cococapods -- DEPRECATED

Add the following line to your Podfile:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'Base64'
end
```

### Usage: Raw Files

Open the Xcode project file, and drag MF_Base64Additions.m/.h into your project.

In files where you want to use Base64 encoding/decoding, simply include the header file and use one of the provided NSData or NSString additions.
    
Example use:
    #import "MF_Base64Additions.h"
    
    NSString *helloWorld = @"Hello World";
    NSString *helloInBase64 = [helloWorld base64String];
    NSString *helloDecoded = [NSString stringFromBase64String:helloInBase64];




Performance
----
* Encoding: Approximately 4 to 5 times faster than using the equivalent SecTransform.
* Encoding: 30% faster than https://github.com/l4u/NSData-Base64
* Decoding: 5% faster than using the equivalent SecTransform.
* Decoding: 5% faster than https://github.com/l4u/NSData-Base64

Performance metrics are based on evaluation done in 2012 and may no longer be accurate.

Requirements
-----
* Compile with Automatic Reference Counting
* Compatible with Mac OSX 10.9+ and iOS 4.0+



Implementation
----
* Implemented as per RFC 4648, see http://www.ietf.org/rfc/rfc4648.txt for more details.



Licensing
----
* Public Domain
