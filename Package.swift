// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "FutureQ",
    platforms: [
        .macOS(.v10_12),
        .iOS(.v10),
        .tvOS(.v10),
        .watchOS(.v3)
    ],
    products: [
        .library(name: "FutureQ", targets: ["FutureQ"])
    ],
    targets: [
        .target(name: "FutureQ"),
        .testTarget(name: "FutureQTests", dependencies: ["FutureQ"])
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
