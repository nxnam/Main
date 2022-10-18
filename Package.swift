// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Main",
    platforms: [.iOS(.v12)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Main",
            targets: ["Main"]),
    ],
    dependencies: [
        .package(url: "https://github.com/nxnam/Home", branch: "main"),
        .package(url: "https://github.com/nxnam/Following", branch: "main"),
        .package(url: "https://github.com/nxnam/Personal", branch: "main"),
        .package(url: "https://github.com/uber/RIBs", branch: "main")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Main",
            dependencies: ["Home", "Following", "Personal", "RIBs"]),
        .testTarget(
            name: "MainTests",
            dependencies: ["Main"]),
    ]
)
