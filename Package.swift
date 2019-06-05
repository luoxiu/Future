// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "Future.swift",
    platforms: [
        .macOS(.v10_12),
        .iOS(.v10),
        .tvOS(.v10),
        .watchOS(.v3)
    ],
    products: [
        .library(name: "Future", targets: ["Future"])
    ],
    targets: [
        .target(name: "Future"),
        .testTarget(name: "FutureTests", dependencies: ["Future"])
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
