/*:
# animateWithDuration
[Refer](https://possiblemobile.com/2015/03/prototyping-uiview-animations-swift-playground/)
*/

import UIKit
import XCPlayground

class ViewController: UIViewController {
    let startingColor = [#Color(colorLiteralRed: 0.9411764705882353, green: 0.7843137254901961, blue: 0.5411764705882353, alpha: 1)#]
    let endingColor = [#Color(colorLiteralRed: 1, green: 0, blue: 0, alpha: 1)#]

    var circle:UIView!
    var rectangle:UIView!

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        construnctView()

        self.runAnimation()
    }

    func construnctView() {
        //: Make circle
        circle = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0))
        circle.layer.cornerRadius = 25.0
        circle.backgroundColor = startingColor

        //: Make rectangle
        rectangle = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0))
        rectangle.layer.cornerRadius = 5.0
        rectangle.backgroundColor = UIColor.whiteColor()

        //: Located on center
        rectangle.center = CGPointMake(view.bounds.width / 2, view.bounds.height / 2)
        circle.center = CGPointMake(view.bounds.width / 2, view.bounds.height / 2)

        //: Add subview
        view.addSubview(circle)
        view.addSubview(rectangle)
    }

    func runAnimation() {
        //: animateWithDuration
        UIView.animateWithDuration(4.0) { () -> Void in
            print("start animation")
            self.circle.backgroundColor = self.endingColor

            self.circle.transform = CGAffineTransformMakeScale(5.0, 5.0)
            self.rectangle.transform = CGAffineTransformMakeRotation(3.14)
        }
    }
}

PlaygroundHelper.showViewController(ViewController())

