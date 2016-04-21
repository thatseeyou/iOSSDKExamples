/*:
 ### CIFilter를 이용한 QR 코드 생성
 - 작은 이미지를 확대할 경우에 anti-aliasing이 되지 않도록 하는 과정도 필요
     - maginificationFilter를 FilterNearest로 사용하는 경우에 CIImage로 부터 UIImage를 만든 경우에는 효과가 없다.
     - Graphics Context에 InterpolationQuality를 조정해서 다시 그리는 방법도 가능
 */
import Foundation
import UIKit

class ViewController : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        makeQRCode()
    }

    func makeQRCode() {
        let qrFilter = CIFilter(name:"CIQRCodeGenerator")
        qrFilter?.setValue("H", forKey: "inputCorrectionLevel")
        let stringData = "https://github.com/thatseeyou".dataUsingEncoding(NSUTF8StringEncoding)
        qrFilter?.setValue(stringData, forKey: "inputMessage")
        let result = qrFilter?.valueForKey("outputImage") as? CIImage

        let smallImage = UIImage(CIImage: result!)

        let image = resizeImageWithoutInterpolation(smallImage, size: CGSizeMake(140, 140))

        // 1. InterpolationQuality
        showImage(image, center: CGPointMake(self.view.bounds.midX, 70))
        // 2. magnificationFilter : CGImage backed UIImage
        showScaledImage(UIImage(CGImage:CGImageFromCIImage(result!)), center: CGPointMake(self.view.bounds.midX, 220))
        // 3. magnificationFilter : CIImage backed UIImage (No effective)
        showScaledImage(smallImage, center: CGPointMake(self.view.bounds.midX, 370))
    }

    func showImage(image:UIImage, center:CGPoint) {
        let imageView = UIImageView(image: image)
        imageView.center = center
        imageView.contentMode = .Center

        self.view.addSubview(imageView)
    }

    func showScaledImage(image:UIImage, center:CGPoint) {
        let imageView = UIImageView(image: image)
        imageView.bounds = CGRectMake(0,0,140,140)
        imageView.center = center
        imageView.contentMode = .ScaleAspectFit
        imageView.layer.magnificationFilter = kCAFilterNearest

        self.view.addSubview(imageView)
    }

    func CGImageFromCIImage(image: CIImage) -> CGImage {
        let context = CIContext(options: nil)
        return context.createCGImage(image, fromRect:image.extent)
    }

    func resizeImageWithoutInterpolation(sourceImage:UIImage, size:CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        do {
            CGContextSetInterpolationQuality(UIGraphicsGetCurrentContext(), .None)
            sourceImage.drawInRect(CGRectMake(0, 0, size.width, size.height))
        }
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return result
    }
}

PlaygroundHelper.showViewController(ViewController())


