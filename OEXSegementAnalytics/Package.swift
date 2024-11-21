// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OEXSegementAnalytics",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "OEXSegementAnalytics",
            targets: ["OEXSegementAnalytics"])
    ],
    
    dependencies: [
        .package(url: "https://github.com/openedx/openedx-app-foundation-ios.git", from: "1.0.0"),
        .package(url: "https://github.com/segmentio/analytics-swift.git", from: "1.5.3"),
        .package(url: "https://github.com/segment-integrations/analytics-swift-firebase", from: "1.3.5")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "OEXSegementAnalytics",
            dependencies: [
                .product(name: "OEXFoundation", package: "openedx-app-foundation-ios"),
                .product(name: "Segment", package: "analytics-swift"),
                .product(name: "SegmentFirebase", package: "analytics-swift-firebase")
            ]
        ),
        .testTarget(
            name: "OEXSegementAnalyticsTests",
            dependencies: ["OEXSegementAnalytics"]
        )
    ]
)
