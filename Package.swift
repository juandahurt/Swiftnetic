// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Swiftnetic",
    products: [
        .library(
            name: "Swiftnetic",
            targets: ["Swiftnetic"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Swiftnetic",
            dependencies: []),
        .testTarget(
            name: "SwiftneticTests",
            dependencies: ["Swiftnetic"]),
    ]
)
