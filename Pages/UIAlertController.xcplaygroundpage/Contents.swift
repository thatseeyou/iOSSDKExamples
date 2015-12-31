/*:
UIAlertController

playground에서는 표시되지 않는다?
*/
import Foundation
import UIKit
import Social

class ViewController : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = [#Color(colorLiteralRed: 0, green: 0, blue: 1, alpha: 1)#]
        title = "View 1"
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        let ac = UIAlertController(title: "Corrent", message: "Your score is 100", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: newQuestion))
        self.presentViewController(ac, animated: false, completion: nil)
    }

    func newQuestion(action: UIAlertAction? = nil) {
        print("newQuestion called")
    }
}

PlaygroundHelper.showViewController(UINavigationController(rootViewController: ViewController()))


