// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "Future",
    platforms: [
        .macOS(.v10_12),
        .iOS(.v10),
        .tvOS(.v10),
        .watchOS(.v3)
    ],
    products: [
        .library(name: "Future", targets: ["Future"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-atomics.git", .upToNextMinor(from: "0.0.1"))
    ],
    targets: [
        .target(name: "Future", dependencies: ["Atomics"]),
        .testTarget(name: "FutureTests", dependencies: ["Future"])
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
