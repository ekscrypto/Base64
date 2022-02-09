// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "Base64",
    platforms: [
        .iOS(.v9),
        .macOS(.v10_10),
        .watchOS(.v3),
        .tvOS(.v9),
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "Base64",
            targets: ["Base64"]
        )
    ],
    dependencies: [],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(name: "Base64")
    ]
)
