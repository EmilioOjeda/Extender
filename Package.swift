// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "Extender",
    platforms: [
        .iOS(.v14),
        .macOS(.v12), // <-- The minimum version required by `SwiftLintPlugin`.
        .tvOS(.v14),
        .watchOS(.v7),
        .driverKit(.v20)
    ],
    products: [
        .library(
            name: "SwiftExtended",
            targets: ["SwiftExtended"]),
        .library(
            name: "FoundationExtended",
            targets: ["FoundationExtended"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/realm/SwiftLint",
            from: "0.52.4"),
    ],
    targets: [
        .target(
            name: "SwiftExtended",
            plugins: [
                .plugin(
                    name: "SwiftLintPlugin",
                    package: "SwiftLint")
            ]),
        .testTarget(
            name: "SwiftExtendedTests",
            dependencies: ["SwiftExtended"],
            plugins: [
                .plugin(
                    name: "SwiftLintPlugin",
                    package: "SwiftLint")
            ]),
        .target(
            name: "FoundationExtended",
            dependencies: ["SwiftExtended"],
            plugins: [
                .plugin(
                    name: "SwiftLintPlugin",
                    package: "SwiftLint")
            ]),
        .testTarget(
            name: "FoundationExtendedTests",
            dependencies: ["FoundationExtended"],
            plugins: [
                .plugin(
                    name: "SwiftLintPlugin",
                    package: "SwiftLint")
            ]),
    ]
)
