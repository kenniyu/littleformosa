//
//  RandomGenerator.swift
//  LittleFormosa
//
//  Created by Ken Yu on 7/16/16.
//  Copyright © 2016 ken. All rights reserved.
//

import Foundation

public class RandomGenerator {
    public static let kLastNames = ["Yu", "Lee", "Chen", "Tsai", "Lin", "Liu", "Wu", "Chan", "Chang", "Chung", "Teng", "Young", "Chou", "Zhu", "Shen", "Cai", "Yang"]
    public static let kFirstNames = ["James", "John", "Robert", "Michael", "William", "David", "Richard", "Charles", "Joseph", "Thomas", "Chris", "Daniel", "Paul", "Mark", "George", "Steven", "Edward", "Kevin", "Jason", "Matthew", "Timothy"]
    
    public class func generateName() -> String {
        let randomLastNameIndex = Int(arc4random_uniform(UInt32(kLastNames.count)))
        let randomFirstNameIndex = Int(arc4random_uniform(UInt32(kFirstNames.count)))
        let lastName = kLastNames[randomLastNameIndex]
        let firstName = kFirstNames[randomFirstNameIndex]
        return "\(firstName) \(lastName)"
    }
}