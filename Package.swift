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
        .library(
            name: "Base64",
            targets: ["Base64"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Base64",
            path: "Base64",
            sources: ["MF_Base64Additions.m"]),
        .testTarget(
            name: "Base64Tests",
            dependencies: ["Base64"],
            path: "Base64Tests")
    ]
)
