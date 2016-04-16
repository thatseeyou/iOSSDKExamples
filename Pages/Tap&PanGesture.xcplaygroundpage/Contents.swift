import UIKit

class TileView : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.layer.borderWidth = 1
        self.layer.borderColor = [#Color(colorLiteralRed: 0.1288586854934692, green: 0, blue: 0.4869538545608521, alpha: 1)#].CGColor

        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapped(_:)))
        self.addGestureRecognizer(tap)

        let drag = UIPanGestureRecognizer(target: self, action: #selector(self.dragged(_:)))
        self.addGestureRecognizer(drag)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func tapped(tapRecognizer : UITapGestureRecognizer) {
        if tapRecognizer.state == UIGestureRecognizerState.Ended {
            self.backgroundColor = [#Color(colorLiteralRed: 0.8949507474899292, green: 0.1438436359167099, blue: 0.08480125665664673, alpha: 1)#]
            NSLog("local : \(tapRecognizer.locationInView(self)), window : \(tapRecognizer.locationInView(nil))")
        }
    }

    func dragged(dragGesture: UIPanGestureRecognizer) {
        if dragGesture.state == .Began || dragGesture.state == .Changed {
            let newPosition = dragGesture.translationInView(dragGesture.view!)

            dragGesture.view!.frame = CGRectOffset(dragGesture.view!.frame, newPosition.x, newPosition.y)

            dragGesture.setTranslation(CGPointZero,
                                       inView: dragGesture.view)
        }
    }
}

class ViewController : UIViewController {

    var targetView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()


        self.view.backgroundColor = [#Color(colorLiteralRed: 0.7602152824401855, green: 0.7601925134658813, blue: 0.7602053880691528, alpha: 1)#]
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        for x in 0..<10 {
            for y in 0..<12 {
                self.view.addSubview(TileView(frame: CGRectMake(CGFloat(x * 30), CGFloat(y * 30), 30, 30)))
            }
        }
    }
}

PlaygroundHelper.showViewController(ViewController())


