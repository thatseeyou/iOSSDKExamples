//: ## GKRandomSource

import GameplayKit

//: ### arrayByShufflingObjectsInArray
//: Input array isn't changed
var cards = [String]()
func resetCard() {
    cards = ["송학", "매조", "사쿠라", "흑싸리", "난초", "모란", "홍싸리", "공산", "국진", "단풍", "오동", "비"]
}

resetCard()
for i in 0..<2 {
    GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(cards) as! [String]
    print(cards.joinWithSeparator(" "))
}

//: So replace input with output
resetCard()
for i in 0..<2 {
    cards = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(cards) as! [String]
    print(cards.joinWithSeparator(" "))
}

//: ### nextIntWithUpperBound
//: [0, upper bound) 범위의 Int를 리턴
for i in 0..<10 {
    print(GKRandomSource.sharedRandom().nextIntWithUpperBound(10), terminator: " ")
}


//: ### nextUniform
//: [0.0, 1.0] 범위의 Float를 리턴
for i in 0..<10 {
    GKRandomSource.sharedRandom().nextUniform()
}

//: ### Independent random source
//: GKRandomSource is GKARC4RandomSource
let independentRandomSource = GKRandomSource()

resetCard()
for i in 0..<2 {
    cards = independentRandomSource.arrayByShufflingObjectsInArray(cards) as! [String]
    print(cards.joinWithSeparator(" "))
}

