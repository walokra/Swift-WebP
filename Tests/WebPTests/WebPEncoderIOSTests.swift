#if os(iOS)
import XCTest
import Foundation
import UIKit
@testable import WebP

class WebPEncoderIOSTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testExample() throws {
        let encoder = WebPEncoder()

        let path = Bundle.module.url(forResource: "jiro", withExtension: "jpg")!
        let uiimage = UIImage(contentsOfFile: path.path)!
        let data = try encoder.encode(uiimage, config: .preset(.photo, quality: 100))
        XCTAssertTrue(data.count > 0)

        let decoder = WebPDecoder()
        var options = WebPDecoderOptions()
        options.useScaling = true
        options.scaledWidth = Int(uiimage.size.width)
        options.scaledHeight = Int(uiimage.size.height)
        let decodedImage = try decoder.decode(data, options: options)
        XCTAssertEqual(decodedImage.width, options.scaledWidth)
        XCTAssertEqual(decodedImage.height, options.scaledHeight)
    }

}
#endif
