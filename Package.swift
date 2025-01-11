// swift-tools-version: 5.6

import PackageDescription

let package = Package(
  name: "brh-segmented-control",
  platforms: [.iOS(.v15), .macOS(.v12)],
  products: [
    .library(
      name: "BRHSegmentedControl",
      targets: ["BRHSegmentedControl"]),
  ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.17.0"),
    .package(url: "https://github.com/nalexn/ViewInspector", from: "0.10.1"),
  ],
  targets: [
    .target(
      name: "BRHSegmentedControl"),
    .testTarget(
      name: "BRHSegmentedControlTests",
      dependencies: [
        "BRHSegmentedControl",
        .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
        .product(name: "ViewInspector", package: "ViewInspector"),
      ]
    ),
  ]
)
