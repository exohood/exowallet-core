// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "Changelly",
    platforms: [.iOS(.v10), .macOS(.v10_12), .tvOS(.v10), .watchOS(.v3)],
    products: [
        .library(name: "Changelly", targets: ["Changelly"]),
    ],
    dependencies: [
        .package(url: "https://github.com/coinpaprika/coinpaprika-api-swift-client.git", from: "2.3.0"),
    ],
    targets: [
        .target(
            name: "Changelly",
            dependencies: ["CoinpaprikaNetworking"],
            path: "ChangellyAPI/Classes"
        ),
        .testTarget(
            name: "ChangellyTests",
            dependencies: ["Changelly"],
            path: "Example/Tests"
        )
    ]
)
