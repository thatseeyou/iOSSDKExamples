/*:
# UITableViewCell의 Style
* 기본으로 제공하는 style을 확인한다.
* Custom style을 사용하는 경우에 contentView에 subview를 추가한다.
*/
import Foundation
import UIKit

class ViewController: UICollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Interface Builder를 사용하는 경우에는 불필요하다.
        self.collectionView?.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")

        self.collectionView!.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Header")


        // FlowLayout 설정
        // 아래와 같이 정적인 속성을 하거나
        // UICollectionViewDelegateFlowLayout을 통해서 동적인 설정할 수도 있다.
//        let layout = self.collectionView!.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.itemSize = CGSizeMake(150,50)
//        layout.minimumLineSpacing = 10.0
//        layout.minimumInteritemSpacing = 10.0


        // 배경을 지정하는 2가지 방법
        // backgroundColor vs. backgroundView
        self.collectionView!.backgroundColor = [#Color(colorLiteralRed: 0, green: 1, blue: 1, alpha: 1)#]

        let overrideBackgroundColor = false
        if overrideBackgroundColor {
            let v = UIView()
            v.backgroundColor = [#Color(colorLiteralRed: 1, green: 1, blue: 0, alpha: 1)#]
            self.collectionView!.backgroundView = v
        }
    }

//    override func prefersStatusBarHidden() -> Bool {
//        return true
//    }
//
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }

    /*
    View hierarchy

    5. cell content view
    4. cell selected backround
    3. cell background view
    2. cell background color
    1. collection view background
    0. window background
    */

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell",
            forIndexPath:indexPath)

        if cell.backgroundView == nil { // brand new cell
            cell.backgroundColor = UIColor.redColor()

            let v = UIImageView(frame:cell.bounds)
            v.contentMode = .ScaleToFill
            v.image = [#Image(imageLiteral: "people.user_simple 64.png")#]
            cell.backgroundView = v

            let v2 = UIView(frame:cell.bounds)
            v2.backgroundColor = UIColor(white:0.2, alpha:0.1)
            cell.selectedBackgroundView = v2

            let lab = UILabel()
            lab.translatesAutoresizingMaskIntoConstraints = false
            lab.tag = 1
            lab.textColor = UIColor.blackColor()
            lab.highlightedTextColor = UIColor.whiteColor()
            lab.backgroundColor = UIColor.clearColor()
            cell.contentView.addSubview(lab)
            // autolayout은 관련 view가 view hierarchy를 구성한 후에 추가해야 한다.
            NSLayoutConstraint.activateConstraints([
                lab.centerXAnchor.constraintEqualToAnchor(cell.contentView.centerXAnchor),
                lab.centerYAnchor.constraintEqualToAnchor(cell.contentView.centerYAnchor)
                ])

        }
        let lab = cell.viewWithTag(1) as! UILabel
        lab.text = "Howdy there \(indexPath.item)"
        return cell
    }

    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        var v : UICollectionReusableView! = nil
        if kind == UICollectionElementKindSectionHeader {
            v = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier:"Header", forIndexPath:indexPath)
            if v.subviews.count == 0 {
                v.addSubview(UILabel(frame:CGRectMake(0,0,30,30)))
            }
            let lab = v.subviews[0] as! UILabel
            //lab.text = (self.sectionNames)[indexPath.section]
            lab.textAlignment = .Center
        }
        return v
    }


    func simulateUserInput() {
        collectionView?.scrollToItemAtIndexPath(NSIndexPath(forItem: 29, inSection: 0), atScrollPosition: .Bottom, animated: true)

    }
}

extension ViewController : UICollectionViewDelegateFlowLayout {
    // UICollectionViewFlowLayout은 디폴트로 collection view의 delegate을 자신의 delegate으로 삼는다.
    // item에 따라서 다르지 않은 경우에는 property를 통해서 설정하면 된다.
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(150,50)
    }
    //    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
    //    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 10.0
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 10.0
    }
    //    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    //
    //    }
    //    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
    //
    //    }
}

let viewController = ViewController(collectionViewLayout:UICollectionViewFlowLayout())

PlaygroundHelper.showViewController(viewController)

Utility.runActionAfterTime(1.0) {
    viewController.simulateUserInput()
}




