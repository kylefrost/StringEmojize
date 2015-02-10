# StringEmojize
####Extension of Swift's String to convert [Emoji Cheat Sheet](http://www.emoji-cheat-sheet.com/) codes into their Unicode equivalent.

## Getting Started

Simply add the StringEmojize folder at the root of this repo to your project. Swift doesn't require you to import the files (see below for CocoaPods).

```swift
var emojiCodeString = "This string has an Emoji :+1:"
println(emojiCodeString.emojizedString())
```

*If you are installing with CocoaPods, you will need to import*
```swift
import StringEmojize
```

---

## Methods

```swift
func emojizedString() -> String
func emojizedStringWithString(text: String) -> String
```

---

## Support
StringEmojize has only been tested on Xcode 6.1.1 with iOS 8, however any iOS device supporting Swift should be able to run it (but, that is untested).

---

## License and Credits

License: See [LICENSE](LICENSE).

Original idea from [diy/NSStringEmojize](https://github.com/diy/NSStringEmojize) for converting Objective-C NSString's to Emojis.
