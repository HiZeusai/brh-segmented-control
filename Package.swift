// swift-tools-version: 5.6

import PackageDescription

let package = Package(
  name: "brh-segmented-control",
  platforms: [.iOS(.v15), .macOS(.v12)],
  products: [
    .library(
      name: "brh-segmented-control",
      targets: ["BRHSegmentedControl"]),
  ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.17.0"),
  ],
  targets: [
    .target(
      name: "BRHSegmentedControl"),
    .testTarget(
      name: "BRHSegmentedControlTests",
      dependencies: [
        "BRHSegmentedControl",
        .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
      ]
    ),
  ]
)
