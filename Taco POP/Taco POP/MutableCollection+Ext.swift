//
//  MutableCollection+Ext.swift
//  Taco POP
//
//  Created by Shankar Prajapati on 10/15/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import Foundation

extension MutableCollection where Index == Int {
    mutating func shuffle() {
        if count < 2 { return }
        
        for i in startIndex ..< endIndex - 1 {
            let j = Int(arc4random_uniform(UInt32(endIndex - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}
