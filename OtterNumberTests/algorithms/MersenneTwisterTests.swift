//
//  MersenneTwisterTests.swift
//  OtterNumber
//
//  Created by Ethan Smith on 6/14/15.
//  Copyright (c) 2015 Ethan Smith. All rights reserved.
//

import Foundation
import XCTest

class MersenneTwisterTests : XCTestCase {
   func testGenerate() {
      var alg = MersenneTwister(seed: 4)
      XCTAssertEqual(4153361530, alg.generate())
      XCTAssertEqual(3868139694, alg.generate())
      XCTAssertEqual(2350344631, alg.generate())
      XCTAssertEqual(741720773, alg.generate())
      XCTAssertEqual(4177647489, alg.generate())
      XCTAssertEqual(3674863976, alg.generate())
      XCTAssertEqual(3070111319, alg.generate())
      XCTAssertEqual(2615787976, alg.generate())

      // Over 32 bit seed
      alg = MersenneTwister(seed: 58959875987)
      XCTAssertEqual(3979592771, alg.generate())
      XCTAssertEqual(4174264076, alg.generate())
      XCTAssertEqual(2115635686, alg.generate())
      XCTAssertEqual(1345825630, alg.generate())
      XCTAssertEqual(392225263, alg.generate())
      XCTAssertEqual(313259443, alg.generate())
      XCTAssertEqual(1373121156, alg.generate())
      XCTAssertEqual(3703663913, alg.generate())
   }
}
