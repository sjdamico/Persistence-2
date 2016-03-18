//
//  FourLines.swift
//  Persistence
//
//  Created by Steve D'Amico on 3/17/16.
//  Copyright © 2016 Steve D'Amico. All rights reserved.
//

import Foundation

/* Implementation of all the methods necessary to conform to the NSCoding and NSCopying protocols. The lines property is encoded in encodeWithCoder() and decoded using the same key value in initWithCoder() \. In copyWithZone, a new FourLines object is created and the string array is copied to it so that the original will not affect the new object.  */

class FourLines: NSObject, NSCoding, NSCopying {
    private static let linesKey = "linesKey"
    var lines:[String]?
    
    override init() {
    }
    
    required init?(coder decoder: NSCoder) {
        lines = decoder.decodeObjectForKey(FourLines.linesKey) as? [String]
    }
    
    func encodeWithCoder(coder: NSCoder) {
        if let saveLines = lines {
            coder.encodeObject(saveLines, forKey: FourLines.linesKey)
        }
    }
    
    func copyWithZone(zone: NSZone) -> AnyObject {
        let copy = FourLines()
        if let linesToCopy = lines {
            var newLines = Array<String>()
            for line in linesToCopy {
                newLines.append(line)
            }
            copy.lines = newLines
        }
        return copy
    }
}