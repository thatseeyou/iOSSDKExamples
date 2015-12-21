/*:
UINavigationController

Using
* dispatch_after
*/
import Foundation
import UIKit
import Social

import XCPlayground

/*:
Prepare for key window and live view
*/
var window : UIWindow! = UIWindow(frame: CGRect(x: 0.0, y: 0.0, width: 320, height: 480))
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
        navigationItem.title = "View 1"
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(3 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            self.navigationController?.pushViewController(ViewController2(), animated: true)
        }
    }
}

/*:
Second View Controller
*/
class ViewController2 : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = [#Color(colorLiteralRed: 0, green: 1, blue: 0, alpha: 1)#]
        navigationItem.title = "View 2"
        //title = "View 2"
    }
}

/*:
Show
*/
let navController = UINavigationController(rootViewController: ViewController())
print(navController.view)
UIApplication.sharedApplication().keyWindow!.rootViewController = navController




