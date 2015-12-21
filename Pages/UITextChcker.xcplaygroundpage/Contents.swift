/*:
# UITextChecker
다음과 같은 기능을 제공
* 오타찾기
* 자동완성
* 단어등록
*/
import Foundation
import UIKit

UITextChecker.availableLanguages()

/*:
### 오타찾기 : rangeOfMisspelledWordInString
*/
func ex1() {
    let textChecker = UITextChecker()

    let document = "I loev you"
    let language = "en_US"

    print("\(document.characters.count)")

    let rangeOfMisspelled = textChecker.rangeOfMisspelledWordInString(document, range: NSMakeRange(0, document.characters.count), startingAt: 0, wrap: false, language: language)

    if rangeOfMisspelled.location == NSNotFound {
        print("Not Found")
    }
    else {
        print(rangeOfMisspelled)
        textChecker.guessesForWordRange(rangeOfMisspelled, inString: document, language: language)
    }
}

/*:
### 자동완성 : completionsForPartialWordRange
*/
func ex2() {
    let textChecker = UITextChecker()

    let document = "lov"
    let language = "en_US"

    let completions = textChecker.completionsForPartialWordRange(NSMakeRange(0, document.characters.count), inString: document, language: language)

    if let completions = completions as? [String] {
        print(completions)
    }
    else {
        print("No completions")
    }
}

ex1()
ex2()


