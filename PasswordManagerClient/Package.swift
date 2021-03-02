// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PasswordManagerClient",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "PasswordManagerClient",
            targets: ["PasswordManagerClient"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/tmandry/AXSwift", from: "0.3.0")
    ],
    targets: [
        .target(
            name: "PasswordManagerClient",
            dependencies: [
                .product(name: "AXSwift", package: "AXSwift")
            ],
            resources: [
                .process("Scripts/script.applescript")
            ]),
        .testTarget(
            name: "PasswordManagerClientTests",
            dependencies: ["PasswordManagerClient"]),
    ]
)
