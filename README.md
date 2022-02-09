![swift workflow](https://github.com/ekscrypto/Base64/actions/workflows/swift.yml/badge.svg) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) ![Issues](https://img.shields.io/github/issues/ekscrypto/Base64) ![Releases](https://img.shields.io/github/v/release/ekscrypto/Base64)

Base64 Additions for Objective-C on Mac OS X and iOS
=======

## LICENSING

The project is dual licensed
* Public Domain
* MIT

Use it under whichever of these two licensing options that are allowed in your country and you feel the most comfortable with.

## Installation
*IMPORTANT* If you have access to Swift libraries, use the built-in Base64 functions. They are faster in most cases.

### Installation: Swift Package Manager

In your Package.swift, add

```swift
import PackageDescription

let package = Package(
    name: "MyApp",
    targets: [],
    dependencies: [
        .Package(url: "https://github.com/ekscrypto/Base64.git", .upToNextMajor(from: "1.2.2"))
    ]
)
```

### Installation: Cococapods

Add the following line to your Podfile:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'Base64'
end
```

### Usage: Objective-C

```Objective-C
NSString *helloWorld = @"Hello World";
NSString *helloInBase64 = [helloWorld base64String];
NSString *helloDecoded = [NSString stringFromBase64String:helloInBase64];
```

### Usage: Swift

*NOT RECOMMENDED: If you have access to the built-in base64 functions offered by Swift, use them.  They are much faster.*

Using MF_Base64codec directly

```Swift
let data = "Hello World".data(using: .utf8)!
let base64 = MF_Base64Codec.base64String(from: data) // SGVsbG8gV29ybGQ=
let querySafeBase64 = MF_Base64Codec.base64UrlEncodedString(fromBase64String: base64) // SGVsbG8gV29ybGQ
```

Using NSData objects
```Swift
let data = "Hello World".data(using: .utf8)! as NSData
let base64 = data.base64String() // SGVsbG8gV29ybGQ=
let querySafeBase64 = data.base64UrlEncodedString() // SGVsbG8gV29ybGQ
```

## Performance
----
* Encoding: 5% *slower* than Swift's built-in Base64 encoding
* Encoding: 4 to 5 times faster than using the equivalent SecTransform.
* Encoding: 30% faster than https://github.com/l4u/NSData-Base64 (metric from 2012)
* Decoding: 4 times *slower* than Swift's built-in Base64 decoding
* Decoding: 5% faster than using the equivalent SecTransform.
* Decoding: 5% faster than https://github.com/l4u/NSData-Base64 (metric from 2012)

Performance metrics are based on evaluation done in 2022 using macOS, Xcode 13.2.1 and Swift 5.5.2 on a 2.2 GHz 6-Core Intel Core i7 MacBook Pro.

## Requirements
-----
* Compile with Automatic Reference Counting
* Compatible with Mac OSX 10.9+ and iOS 4.0+



## Implementation
----
* Implemented as per RFC 4648, see http://www.ietf.org/rfc/rfc4648.txt for more details.
