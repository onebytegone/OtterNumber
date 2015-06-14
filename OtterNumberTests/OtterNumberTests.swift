//
//  OtterNumberTests.swift
//  OtterNumberTests
//
//  Created by Ethan Smith on 6/12/15.
//  Copyright (c) 2015 Ethan Smith. All rights reserved.
//

import UIKit
import XCTest

class OtterNumberTests: XCTestCase {
   func testlimitValue() {
      var otter = OtterNumber()
      XCTAssertEqual(0, otter.limitValue(0, min: 0, max: 5))
      XCTAssertEqual(1, otter.limitValue(1, min: 0, max: 5))
      XCTAssertEqual(2, otter.limitValue(2, min: 0, max: 5))
      XCTAssertEqual(3, otter.limitValue(3, min: 0, max: 5))
      XCTAssertEqual(4, otter.limitValue(4, min: 0, max: 5))
      XCTAssertEqual(0, otter.limitValue(5, min: 0, max: 5))
      XCTAssertEqual(1, otter.limitValue(6, min: 0, max: 5))
      XCTAssertEqual(2, otter.limitValue(7, min: 0, max: 5))
      XCTAssertEqual(3, otter.limitValue(8, min: 0, max: 5))

      XCTAssertEqual(9, otter.limitValue(4, min: 5, max: 10))
      XCTAssertEqual(5, otter.limitValue(5, min: 5, max: 10))
      XCTAssertEqual(6, otter.limitValue(6, min: 5, max: 10))
      XCTAssertEqual(9, otter.limitValue(9, min: 5, max: 10))
      XCTAssertEqual(5, otter.limitValue(10, min: 5, max: 10))
      XCTAssertEqual(6, otter.limitValue(11, min: 5, max: 10))

      XCTAssertEqual(-15, otter.limitValue(0, min: -15, max: -10))
      XCTAssertEqual(-14, otter.limitValue(1, min: -15, max: -10))
      XCTAssertEqual(-13, otter.limitValue(2, min: -15, max: -10))
      XCTAssertEqual(-12, otter.limitValue(3, min: -15, max: -10))
      XCTAssertEqual(-11, otter.limitValue(4, min: -15, max: -10))
      XCTAssertEqual(-15, otter.limitValue(0, min: -15, max: -10))
   }
}
