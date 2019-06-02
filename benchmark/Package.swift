// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "benchmark",
    dependencies: [
        .package(url: "https://github.com/mxcl/PromiseKit", from: "6.8.0"),
        .package(url: "https://github.com/Thomvis/BrightFutures", from: "8.0.0"),
        .package(url: "https://github.com/malcommac/Hydra.git", from: "2.0.0"),
        .package(url: "https://github.com/google/promises.git", from: "1.2.8"),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "5.0.0"),
        .package(url: "https://github.com/ReactiveCocoa/ReactiveSwift.git", from: "5.0.0"),
        .package(path: "../")
    ],
    targets: [
        .target(
            name: "benchmark",
            dependencies: [
                "PromiseKit",
                "BrightFutures",
                "Hydra",
                "Promises",
                "RxSwift",
                "ReactiveSwift",
                "FutureQ"
            ]),
        .testTarget(
            name: "benchmarkTests",
            dependencies: ["benchmark"]),
    ]
)
