/*:
# animateWithDuration
[Refer](https://possiblemobile.com/2015/03/prototyping-uiview-animations-swift-playground/)
*/

import UIKit
import XCPlayground

let containerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 320, height: 480))
XCPlaygroundPage.currentPage.liveView = containerView

let startingColor = [#Color(colorLiteralRed: 0.9411764705882353, green: 0.7843137254901961, blue: 0.5411764705882353, alpha: 1)#]
let endingColor = [#Color(colorLiteralRed: 1, green: 0, blue: 0, alpha: 1)#]

//: Make circle
let circle = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0))
circle.layer.cornerRadius = 25.0
circle.backgroundColor = startingColor

//: Make rectangle
let rectangle = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0))
rectangle.layer.cornerRadius = 5.0
rectangle.backgroundColor = UIColor.whiteColor()

//: Located on center
rectangle.center = CGPointMake(containerView.bounds.width / 2, containerView.bounds.height / 2)
circle.center = CGPointMake(containerView.bounds.width / 2, containerView.bounds.height / 2)

//: Add subview
containerView.addSubview(circle);
containerView.addSubview(rectangle)

//: animateWithDuration
UIView.animateWithDuration(4.0, animations: { () -> Void in
    circle.backgroundColor = endingColor

    circle.transform = CGAffineTransformMakeScale(5.0, 5.0)
    rectangle.transform = CGAffineTransformMakeRotation(3.14)
})
