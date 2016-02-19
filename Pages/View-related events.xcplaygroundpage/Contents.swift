/*:
# view hierarchy
*/

import UIKit

class ViewController: UIViewControllerTrace {
    let startingColor = [#Color(colorLiteralRed: 0.9411764705882353, green: 0.7843137254901961, blue: 0.5411764705882353, alpha: 1)#]
    let endingColor = [#Color(colorLiteralRed: 1, green: 0, blue: 0, alpha: 1)#]

    override func viewDidLoad() {
        super.viewDidLoad()

        constructSubviews()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

    }

    func constructSubviews() {
        let v1 = UIViewTrace(frame: CGRectMake(10, 10, 300, 300))
        v1.backgroundColor = [#Color(colorLiteralRed: 1, green: 0, blue: 0, alpha: 1)#]

        self.view.addSubview(v1)

        let v2 = UIViewTrace(frame: CGRectMake(10, 10, 200, 200))
        v2.backgroundColor = [#Color(colorLiteralRed: 0.5, green: 0, blue: 0.5, alpha: 1)#]

        v1.addSubview(v2)

        let v3 = UIViewTrace(frame: CGRectMake(10, 10, 100, 100))
        v3.backgroundColor = [#Color(colorLiteralRed: 1, green: 0.5, blue: 0, alpha: 1)#]

        v2.addSubview(v3)
    }
}

PlaygroundHelper.showViewController(ViewController())

