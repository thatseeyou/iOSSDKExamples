import UIKit

class ViewController : UIViewController {

    var targetView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()


        self.view.backgroundColor = [#Color(colorLiteralRed: 0.7602152824401855, green: 0.7601925134658813, blue: 0.7602053880691528, alpha: 1)#]
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        let label = UILabel()
        label.text = "I'm target view"
        label.sizeToFit()
        label.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds))

        self.targetView = label
        self.view.addSubview(self.targetView)

        Utility.runActionAfterTime(1) { [unowned self ] in
            self.pop()
        }
    }

    func pop() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.y")
        animation.fromValue = 0.0
        animation.toValue = M_PI * 2.0
        animation.duration = 2.0
        animation.repeatCount = Float.infinity

        self.targetView.layer.addAnimation(animation, forKey: "spin")

        // 가까우면 크게 멀면 작게
        var transform = CATransform3DIdentity
        transform.m34 = 5.0 / 500.0
        self.targetView.layer.transform = transform
    }
}

PlaygroundHelper.showViewController(ViewController())


