//
//  StringEmojize.swift
//  StringEmojize
//
//  Created by Kyle Frost on 2/9/15.
//  Copyright (c) 2015 Kyle Frost. All rights reserved.
//

import Foundation

private let EmojiRegex = NSRegularExpression(pattern: "(:[a-z0-9-+_]+:)", options: .CaseInsensitive, error:nil)!

extension String {
    
    public func emojizedString() -> String {
        return self.emojizedStringWithString(self)
    }
    
    public func emojizedStringWithString(text: String) -> String {
        var resultText = text
        let matchingRange = NSMakeRange(0, resultText.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        EmojiRegex.enumerateMatchesInString(resultText, options: .ReportCompletion, range: matchingRange, usingBlock: {
            (result: NSTextCheckingResult!, flags: NSMatchingFlags, stop: UnsafeMutablePointer<ObjCBool>) -> Void in
                if ((result != nil) && (result.resultType == .RegularExpression)) {
                    let range = result.range
                    if (range.location != NSNotFound) {
                        var code = (text as NSString).substringWithRange(range)
                        var unicode = EMOJI_HASH[code]!
                        if !unicode.isEmpty {
                            resultText = resultText.stringByReplacingOccurrencesOfString(code, withString:unicode, options: nil, range: nil)
                        }
                    }
                }
        })
        
        return resultText
    }
}
