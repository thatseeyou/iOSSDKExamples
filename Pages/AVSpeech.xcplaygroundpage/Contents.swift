/*:
# AVSpeechSynthesizer
playground 환경에서는 정상 동작하지 않는다.
*/
import AVFoundation

let speechSynthsizer = AVSpeechSynthesizer()

func speech(text: String) {
    let utterance = AVSpeechUtterance(string: text)

    utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
    speechSynthsizer.speakUtterance(utterance)
}

speech("가나다")
speech("돔")

