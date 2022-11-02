// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "Extender",
    products: [
        .library(
            name: "SwiftExtended",
            targets: ["SwiftExtended"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SwiftExtended"),
        .testTarget(
            name: "SwiftExtendedTests",
            dependencies: ["SwiftExtended"]),
    ]
)
