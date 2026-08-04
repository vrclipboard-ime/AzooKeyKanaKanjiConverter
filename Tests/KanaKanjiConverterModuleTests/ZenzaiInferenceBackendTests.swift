import Foundation
@testable import KanaKanjiConverterModule
import XCTest

final class ZenzaiInferenceBackendTests: XCTestCase {
    func testGPUIsDefault() {
        let mode = ConvertRequestOptions.ZenzaiMode.on(
            weight: URL(fileURLWithPath: "/tmp/model.gguf"),
            personalizationMode: nil
        )
        XCTAssertEqual(mode.inferenceBackend, .gpu)
    }

    func testCPUCanBeSelected() {
        let mode = ConvertRequestOptions.ZenzaiMode.on(
            weight: URL(fileURLWithPath: "/tmp/model.gguf"),
            personalizationMode: nil,
            inferenceBackend: .cpu
        )
        XCTAssertEqual(mode.inferenceBackend, .cpu)
    }
}
