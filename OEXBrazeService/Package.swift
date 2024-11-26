// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OEXBrazeService",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "OEXBrazeService",
            targets: ["OEXBrazeService"]
        )
    ],

    dependencies: [
        .package(url: "https://github.com/rnr/openedx-app-foundation-ios.git", branch: "anton/plugins-experiments"),
        .package(path: "../OEXSegementAnalytics"),
        .package(url: "https://github.com/braze-inc/braze-segment-swift.git", from: "2.2.0")
    ],
    
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "OEXBrazeService",
            dependencies: [
                .product(name: "OEXFoundation", package: "openedx-app-foundation-ios"),
                .product(name: "SegmentBraze", package: "braze-segment-swift"),
                .product(name: "OEXSegementAnalytics", package: "OEXSegementAnalytics")
            ]
        ),
        .testTarget(
            name: "OEXBrazeServiceTests",
            dependencies: ["OEXBrazeService"]
        )
    ]
)
