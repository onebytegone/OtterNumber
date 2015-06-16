//
//  MersenneTwister.swift
//  OtterNumber
//
//  Created by Ethan Smith on 6/14/15.
//  Copyright (c) 2015 Ethan Smith. All rights reserved.
//
//  Algorithm Source: https://en.wikipedia.org/wiki/Mersenne_Twister
//

import Foundation

public class MersenneTwister : OtterNumberAlgorithm {
   private(set) var initialSeed: Int64 = 0
   private var numbers: Array<Int64> = []
   private var index = 0

   init(seed: Int64) {
      self.initialSeed = seed
      self.numbers = prepare(seed)
      index = 0
   }

   public func generate() -> Int64 {
      if index == 0 {
         self.numbers = generateNumberSet(self.numbers)
      }

      var x = numbers[index]
      x = x ^ (x >> 11)
      x = x ^ ((x << 7) & (2636928640))
      x = x ^ ((x << 15) & (4022730752))
      x = x ^ (x >> 18)

      // Move ahead for next number
      index = (index + 1) % 624

      return x
   }

   public func prepare(seed: Int64) -> Array<Int64> {
      // Limit seed to 32 bits
      var adjustedSeed = seed & 0xFFFFFFFF

      var VL = [Int64](count: 624, repeatedValue: 0)
      VL[0] = adjustedSeed

      for i in 1...623 {
         let last = VL[i-1]
         let shift = last >> 30
         let xored = last ^ shift
         let increased = 1812433253 * xored + i
         let anded = 0xFFFFFFFF & increased
         VL[i] = anded
      }

      return VL
   }

   func generateNumberSet(seeded: Array<Int64>) -> Array<Int64> {
      var set: Array<Int64> = seeded

      for i in 0...623 {
         let x = (set[i] & 0x80000000) + (set[(i+1) % 624] & 0x7fffffff)

         set[i] = set[(i + 397) % 624] ^ (x >> 1)
         if (x % 2 != 0) {
            set[i] = set[i] ^ 2567483615
         }
      }

      return set
   }
}
