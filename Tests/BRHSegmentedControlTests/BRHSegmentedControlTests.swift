import SnapshotTesting
import SwiftUI
import XCTest
@testable import BRHSegmentedControl

final class InitTests: XCTestCase {
  let recordingMode: SnapshotTestingConfiguration.Record = .missing

  @MainActor
  func testInitWithCountLight() async throws {
    try withSnapshotTesting(record: recordingMode) {
      var selectedIndex = 0
      let view = BRHSegmentedControl(
        selectedIndex: Binding(get: { selectedIndex }, set: { selectedIndex = $0 }),
        count: 4
      )
      try assertSnapshot(matching: view, colorScheme: .light)
    }
  }

  @MainActor
  func testInitWithCountDark() async throws {
    try withSnapshotTesting(record: recordingMode) {
      var selectedIndex = 0
      let view = BRHSegmentedControl(
        selectedIndex: Binding(get: { selectedIndex }, set: { selectedIndex = $0 }),
        count: 4
      )
      try assertSnapshot(matching: view, colorScheme: .dark)
    }
  }

  @MainActor
  func testInitWithLabelsLight() async throws {
    try withSnapshotTesting(record: recordingMode) {
      var selectedIndex = 0
      let view = BRHSegmentedControl(
        selectedIndex: Binding(get: { selectedIndex }, set: { selectedIndex = $0 }),
        labels: ["one", "two", "three"]
      )
      try assertSnapshot(matching: view, colorScheme: .light)
    }
  }

  @MainActor
  func testInitWithLabelsDark() async throws {
    try withSnapshotTesting(record: recordingMode) {
      var selectedIndex = 0
      let view = BRHSegmentedControl(
        selectedIndex: Binding(get: { selectedIndex }, set: { selectedIndex = $0 }),
        labels: ["one", "two", "three"]
      )
      try assertSnapshot(matching: view, colorScheme: .dark)
    }
  }

  @MainActor
  func testInitWithBuilderLight() async throws {
    try withSnapshotTesting(record: recordingMode) {
      var selectedIndex = 0
      let view = BRHSegmentedControl(
        selectedIndex: Binding(get: { selectedIndex }, set: { selectedIndex = $0 }),
        count: 4, builder: { index in
          Text("Seg \(index + 1)")
        })
      try assertSnapshot(matching: view, colorScheme: .light)
    }
  }

  @MainActor
  func testInitWithBuilderDark() async throws {
    try withSnapshotTesting(record: recordingMode) {
      var selectedIndex = 0
      let view = BRHSegmentedControl(
        selectedIndex: Binding(get: { selectedIndex }, set: { selectedIndex = $0 }), count: 4) { index in
          Text("Seg \(index + 1)")
        }
      try assertSnapshot(matching: view, colorScheme: .dark)
    }
  }

  @MainActor
  func testSegmentForegroundStylerLight() async throws {
    try withSnapshotTesting(record: recordingMode) {
      var selectedIndex = 1
      let view = BRHSegmentedControl(
        selectedIndex: Binding(get: { selectedIndex }, set: { selectedIndex = $0 }),
        count: 4, styler: { state in
          switch state {
          case .selected: return Color.green
          case .touched: return .yellow
          case .none: return .orange
          }
        }).disableAnimations(true)
      try assertSnapshot(matching: view, colorScheme: .light)
    }
  }

  @MainActor
  func testSegmentForegroundStylerDark() async throws {
    try withSnapshotTesting(record: recordingMode) {
      var selectedIndex = 1
      let view = BRHSegmentedControl(
        selectedIndex: Binding(get: { selectedIndex }, set: { selectedIndex = $0 }),
        count: 4, styler: { state in
          switch state {
          case .selected: return Color.green
          case .touched: return .yellow
          case .none: return .orange
          }
        }).disableAnimations(true)
      try assertSnapshot(matching: view, colorScheme: .dark)
    }
  }
}
