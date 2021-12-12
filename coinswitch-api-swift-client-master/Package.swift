// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "CoinSwitch",
    platforms: [.iOS(.v10), .macOS(.v10_12), .tvOS(.v10), .watchOS(.v3)],
    products: [
        .library(name: "CoinSwitch", targets: ["CoinSwitch"]),
    ],
    dependencies: [
        .package(url: "https://github.com/coinpaprika/coinpaprika-api-swift-client.git", from: "2.3.0"),
    ],
    targets: [
        .target(
            name: "CoinSwitch",
            dependencies: ["CoinpaprikaNetworking"],
            path: "CoinSwitchAPI/Classes"
         ),
        .testTarget(
            name: "CoinSwitchTests",
            dependencies: ["CoinSwitch"],
            path: "Example/Tests"
        )
    ]
)
