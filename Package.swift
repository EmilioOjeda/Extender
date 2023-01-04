// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "Extender",
    products: [
        .library(
            name: "SwiftExtended",
            targets: ["SwiftExtended"]),
        .library(
            name: "FoundationExtended",
            targets: ["FoundationExtended"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SwiftExtended"),
        .testTarget(
            name: "SwiftExtendedTests",
            dependencies: ["SwiftExtended"]),
        .target(
            name: "FoundationExtended",
            dependencies: ["SwiftExtended"]),
        .testTarget(
            name: "FoundationExtendedTests",
            dependencies: ["FoundationExtended"]),
    ]
)
