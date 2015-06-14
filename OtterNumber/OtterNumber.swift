//
//  OtterNumber.swift
//  OtterNumber
//
//  Created by Ethan Smith on 6/12/15.
//  Copyright (c) 2015 Ethan Smith. All rights reserved.
//

import Foundation

class OtterNumber {
   var algorithm: OtterNumberAlgorithm = MersenneTwister(seed: 42)

   func createSeed() -> Int {
      return Int(NSDate.timeIntervalSinceReferenceDate()*100000)
   }

   func prepare(seed: Int) {
      algorithm = MersenneTwister(seed: seed)
   }

   func generate(min: Int, max: Int) -> Int {
      var randomValue = algorithm.generate()
      return limitValue(randomValue, min: min, max: max)
   }


   /**
    * Limit the value to a given set of values. This does not support negative numbers
    *
    * :param: value The value to map
    * :param: min The lower end of the target range, inclusive
    * :param: max The upper end of the target range, exclusive
    *
    * :returns: Mapped value
    */
   func limitValue(value: Int, min: Int, max: Int) -> Int {
      let sizeOfRange = max - min
      return ( value % sizeOfRange ) + min
   }
}

protocol OtterNumberAlgorithm {
   func generate() -> Int
}