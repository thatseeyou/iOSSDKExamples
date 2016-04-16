/*:
UINavigationController

Using
* dispatch_after
*/
import Foundation
import UIKit
import Social

//: Root View Controller
//: - - -
class ViewController : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = [#Color(colorLiteralRed: 0, green: 0, blue: 1, alpha: 1)#]
        navigationItem.title = "View 1"
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        

        Utility.runActionAfterTime(2.0) {
            self.navigationController?.pushViewController(ViewController2(), animated: true)
        }
    }
}

//: Second View Controller
//: - - -
class ViewController2 : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = [#Color(colorLiteralRed: 0, green: 1, blue: 0, alpha: 1)#]
        navigationItem.title = "View 2"
        //title = "View 2"
    }
}

PlaygroundHelper.showViewController(UINavigationController(rootViewController: ViewController()))


