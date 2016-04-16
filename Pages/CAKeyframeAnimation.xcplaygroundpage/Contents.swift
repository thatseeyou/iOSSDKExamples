import UIKit

class ViewController : UIViewController {

    var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()


        self.view.backgroundColor = [#Color(colorLiteralRed: 0.7602152824401855, green: 0.7601925134658813, blue: 0.7602053880691528, alpha: 1)#]
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        let button = UIButton(type: .ContactAdd)
        button.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds))

        self.view.addSubview(button)
        self.button = button

        Utility.runActionAfterTime(2) { [unowned self ] in
            self.pop()
        }
    }

    func pop() {
        let keyframeAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        keyframeAnimation.values = [0.0, 4.0, 1.0]
        // keyTimes is relative time.
        // absolute time = 0.0 * duration, 0.7 * duration, 1.0 * duration
        keyframeAnimation.keyTimes = [0.0, 0.7, 1.0]
        keyframeAnimation.duration = 0.4
        keyframeAnimation.timingFunction =
            CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        self.button.layer.addAnimation(keyframeAnimation,
                                            forKey: "pop")
    }
}

PlaygroundHelper.showViewController(ViewController())


