/*:
Extended Grapheme Cluster
- [참조](http://www.unicode.org/reports/tr29/tr29-18.html#Hangul_Syllable_Boundary_Determination)
- User-perceived character는 둘 이상의 unicode code point로 구성이 될 수 있다.
- Grapheme cluster는 user-perceived character로 이해할 수 있다.
- 동일하게 인지되는 문자의 표현 방식이 2가지 이상 존재 가능하게 된다.
- 문제는 동일하다고 보는 경우가 실제로 차지하는 바이트 수가 다를 수 있다.
- 지원하는 않는 OS에서는 다르다고 응답을 해서 문제가 될 수 있다.
- Atomic 하게 처리해야 마우스 선택, 커서 키 이동, 백 스페이스 처리 등에 문제가 발생하지 않는다.
- 백스페이스로 하나의 코드 포인트 단위로 삭제(한글 입력시 백스페이스 누를 경우)를 하거나 키보드의 입력을 처리할 경우에는 개별적으로 처리하면 편할 경우도 있다.
*/
import Foundation

/*: 
### 예제 1: 한
- 한글을 표현하는 방법이 2가지가 존재한다.
- 하나의 코드로 표현하는 방법과 초/중/종성으로 표현하는 방법이다.
- 모아쓰기 vs. 풀어쓰기
- iOS에서는 비교를 하면 같다고 판단한다. Linux에서는 다르다고 판단한다.


* 모아쓰기
    - U+D55C : Hangul Syllable Han


* 풀어쓰기 (초/중/종성용 코드 포인트가 다르다)
    - U+1112 : Hangul Choseong Hieuh
    - U+1161 : Hangul Jungseong A
    - U+11AB : Hangul Jongseong Nieun


* 독립 자모 (이전 완성형 코드와 호환)
    - U+314E : Hangul Letter Hieuh
    - U+314F : Hangul Letter A
    - U+3134 : Hangul Letter Nieun
*/
let precomposed = "\u{D55C}"
let decomposed = "\u{1112}\u{1161}\u{11AB}"
let jamo = "\u{314E}\u{314F}\u{3134}"

//: 해석을 해야 하기 때문에 시간이 더 소요될 수 있다.
precomposed.characters.count
decomposed.characters.count
jamo.characters.count

//: 차지하고 있는 바이트 크기와 같다.
precomposed.utf16.count
decomposed.utf16.count
jamo.utf16.count

precomposed.utf8.count
decomposed.utf8.count
jamo.utf8.count

//: 바이트 수가 다르지만 같다고 판단한다.
if precomposed == decomposed {
    print("same character")
}
else {
    print("different character")
}

//: 바이트 수가 일정하지 않기 때문에 integer index를 사용할 수가 없다.
print(decomposed[decomposed.startIndex.advancedBy(0)])
for character in decomposed.characters {
    print(character)
}

//: [Unicode normalization](https://ko.wikipedia.org/wiki/유니코드_정규화)
//:
//: NFC normalization
let NFC = decomposed.precomposedStringWithCanonicalMapping
NFC.utf16.count

//: NFD normalization
let NFD = precomposed.decomposedStringWithCanonicalMapping
NFD.utf16.count

/*:
### 예제 2 : Ǵ
* 모아쓰기
    - U+01F4 : Latin Capital Letter G with Acute

* 풀어쓰기
    - U+0047 : Latin Capital Letter G
    - U+0301 : Combining Acute Accent
*/
let g_precomposed = "\u{01F4}"
let g_decomposed = "\u{0047}\u{0301}"

g_precomposed.characters.count
g_decomposed.characters.count

g_precomposed.utf16.count
g_decomposed.utf16.count

//: 바이트 수가 다르지만 같다고 판단한다.
if g_precomposed == g_decomposed {
    print("same character")
}
else {
    print("different character")
}



