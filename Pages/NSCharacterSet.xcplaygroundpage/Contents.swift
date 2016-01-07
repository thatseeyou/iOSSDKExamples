import Foundation

func showCharacterSet(charset:NSCharacterSet, printGlyph:Bool = false) {
    var number = 0
    //
    // NSData는 연속적이지 않을 수 있으므로 bytes 속성을 이용하면 불연속적인 경우에는 시간이 오래 걸릴 수 있다.
    // 이 경우에 enumerateRangesUsingBlock을 이용하면 연속적인 여러 개의 block을 리턴한다.
    charset.bitmapRepresentation.enumerateByteRangesUsingBlock {
        (pointer: UnsafePointer<Void>, range: NSRange, stop: UnsafeMutablePointer<ObjCBool>) in
            print(range)
            for n in range.location ..< (range.location + range.length) {
                let byte = UnsafePointer<UInt8>(pointer)[n]

                // 0인 경우가 많으므로 byte가 0이 아닌 경우에만 bit을 확인한다.
                if byte > 0 {
                    for i:UInt8 in 0...7 {

                        if (byte & (1 << i)) > 0 {
                            let code = (n * 8) + Int(i)

                            if (printGlyph) {
                                print("\(code): \(Character(UnicodeScalar(code)))")
                            }
                            else {
                                print(code)
                            }
                            number += 1
                        }


//                        let code = (n * 8) + Int(i)
//                        if charset.longCharacterIsMember(UTF32Char(code)) {
//                            if (printGlyph) {
//                                print("\(code): \(Character(UnicodeScalar(code)))")
//                            }
//                            else {
//                                print(code)
//                            }
//                            number += 1
//                        }

                    }
                }
            }
        }

    print("Total number : \(number)")
}

//showCharacterSet(NSCharacterSet.controlCharacterSet())
//showCharacterSet(NSCharacterSet.capitalizedLetterCharacterSet(), printGlyph: true)
//showCharacterSet(NSCharacterSet.decimalDigitCharacterSet(), printGlyph: true)

let numbers = NSCharacterSet(charactersInString: "0123456789")
showCharacterSet(numbers, printGlyph: true)

//showCharacterSet(NSCharacterSet.URLFragmentAllowedCharacterSet(), printGlyph: true)
//showCharacterSet(NSCharacterSet.URLHostAllowedCharacterSet(), printGlyph: true)
showCharacterSet(NSCharacterSet.URLPasswordAllowedCharacterSet(), printGlyph: true)
