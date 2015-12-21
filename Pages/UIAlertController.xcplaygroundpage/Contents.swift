/*:
UIAlertController

playground에서는 표시되지 않는다?
*/
import Foundation
import UIKit
import Social

import XCPlayground

/*:
Prepare for key window and live view
*/
var window : UIWindow! = UIWindow(frame: CGRect(x: 0.0, y: 0.0, width: 768, height: 1024))
window.backgroundColor = [#Color(colorLiteralRed: 1, green: 0, blue: 0, alpha: 1)#]
window.makeKeyAndVisible()
XCPlaygroundPage.currentPage.liveView = UIApplication.sharedApplication().keyWindow!
print(UIApplication.sharedApplication().keyWindow!)

/*:
Root View Controller
*/
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

/*:
다음과 같이 하면 에러 메시지가 표시된다.
- window.rootViewController = ViewController()

에러 메시지
- Presenting view controllers on detached view controllers is discouraged

다음과 같이 수정
- UIApplication.sharedApplication().keyWindow!.rootViewController = ViewController()
*/
let navController = UINavigationController(rootViewController: ViewController())
print(navController.view.frame)
UIApplication.sharedApplication().keyWindow!.rootViewController = navController




