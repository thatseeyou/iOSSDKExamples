/*:
# Self-Sizing Table View Cell
1. table.estimatedRowHeight = <적당한 값>
2. tableView.rowHeight = UITableViewAutomaticDimension
3. apply auto layout to the subviews of contentView
    - 높이 관련 contraint가 충돌을 하면 우선 순위를 조절해서 일시적인 충돌 메시지를 없앨 수 있다.
*/
import Foundation
import UIKit

class TableViewController: UITableViewController {

    let cellIdentifier = "Cell"

    let cellImage = [#Image(imageLiteral: "people.user_simple 64.png")#]

//: override UIViewController method
//: - - -
    override func viewDidLoad() {
        print ("viewDidLoad")

        super.viewDidLoad()

        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        // 줄의 좌우 여백을 준다.
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15)

        self.tableView.estimatedRowHeight = 5
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }

//: UITableViewDelegate protocol
//: - - -

//: UITableViewDataSource protocol
//: - - -
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)

        let kImageTag = 1

        // one-time configuration
        if cell.contentView.subviews.count == 0 {
            let view = UIImageView()
            view.tag = kImageTag
            cell.contentView.addSubview(view)

            let d = ["view":view]
            view.translatesAutoresizingMaskIntoConstraints = false

            var constraints = [NSLayoutConstraint]()

            let cs_centerX = view.centerXAnchor.constraintEqualToAnchor(cell.contentView.centerXAnchor)
            cs_centerX.identifier = "center horizontally"
            constraints.append(cs_centerX)

            let cs_square = view.widthAnchor.constraintEqualToAnchor(view.heightAnchor)
            cs_square.identifier = "square"
            constraints.append(cs_square)

            //
            // rowHeight에 대한 값이 정해져 있어서 정해져 있어서 보기 싫은 경고 메시지가 보인다.
            // 이런 경우에는 우선 순위를 낮추어서 경고 메시지가 없어지게 하면 된다.
            // 우선 순위가 낮다고 적용이 되지 않는 것은 아닌다.
            // 일시적인 충돌이라서 원하는 결과를 얻을 수 있게 된다.
            //
            let cs_size = view.widthAnchor.constraintEqualToConstant(100)
            cs_size.priority = 999
            cs_size.identifier = "size"
            constraints.append(cs_size)

            let cs_posY = NSLayoutConstraint.constraintsWithVisualFormat("V:|-10-[view]-10-|",
                options:[], metrics:nil, views:d)
            for i in 0..<cs_posY.count {
                cs_posY[i].identifier = "cs_posY[\(i)]"
            }
            constraints.appendContentsOf(cs_posY)

            NSLayoutConstraint.activateConstraints(constraints)
        }

        //
        // templateImage를 이용해서 색(tintColor)를 변경하기
        // row에 따라서 색을 변경
        let view = cell.viewWithTag(kImageTag) as! UIImageView
        let templateImage = cellImage.imageWithRenderingMode(.AlwaysTemplate)
        view.image = templateImage
        view.tintColor = UIColor(hue: CGFloat(indexPath.row) * 0.1, saturation: 1.0, brightness: 1.0, alpha: 1.0)

        return cell
    }

    func simulateUserInput() {
        tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: 9, inSection: 0), atScrollPosition: .Bottom, animated: true)
    }
}

let viewController = TableViewController(style: .Plain)
PlaygroundHelper.showViewController(viewController)

Utility.runActionAfterTime(1.0) {
    viewController.simulateUserInput()
}

