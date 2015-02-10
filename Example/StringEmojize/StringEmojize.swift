//
//  StringEmojize.swift
//  StringEmojize
//
//  Created by Kyle Frost on 2/9/15.
//  Copyright (c) 2015 Kyle Frost. All rights reserved.
//

import Foundation

extension String {
    
    func emojizedString() -> String {
        return self.emojizedStringWithString(self)
    }
    
    func emojizedStringWithString(text: String) -> String {
        var onceToken: dispatch_once_t = 0
        var regex = NSRegularExpression()
        
        dispatch_once(&onceToken) {
            regex = NSRegularExpression(pattern: "(:[a-z0-9-+_]+:)", options: .CaseInsensitive, error:nil)!
        }
        
        var resultText = text
        let matchingRange = NSMakeRange(0, resultText.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        regex.enumerateMatchesInString(resultText, options: .ReportCompletion, range: matchingRange, usingBlock: {
            (result: NSTextCheckingResult!, flags: NSMatchingFlags, stop: UnsafeMutablePointer<ObjCBool>) -> Void in
                if ((result != nil) && (result.resultType == .RegularExpression)) {
                    let range = result.range
                    if (range.location != NSNotFound) {
                        var code = (text as NSString).substringWithRange(range)
                        var unicode = self.emojiAliases(code)
                        if !unicode.isEmpty {
                            resultText = resultText.stringByReplacingOccurrencesOfString(code, withString:unicode, options: nil, range: nil)
                        }
                    }
                }
        })
        
        return resultText
    }
    
    func emojiAliases(key: String) -> String {
        //var myDict = Dictionary<String, String>()
        var value: String = ""
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            value = EMOJI_HASH[key]!
        }
        
        return value
    }
}