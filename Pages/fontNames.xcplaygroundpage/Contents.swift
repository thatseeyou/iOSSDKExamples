import UIKit

for fontFamilyName in UIFont.familyNames() as! [String] {
    for fontName in UIFont.fontNamesForFamilyName(fontFamilyName) as! [String] {
        print("Available font: \(fontName)")
    }
}