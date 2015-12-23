/*:
# Table View Section Header or Footer

### tableView: viewForHeaderInSection:
* contentView, backgroundView를 통해서 customization 할 수 있다.
* height = 0 이라서 표시되지 않을 수 있으므로 추가로 height도 지정해 주어야 한다. 아래 2가지 가능.
    - sectionHeaderHeight
    - tableView: heightForHeaderInSection

### tableView: titleForFooterInSection:
* 간단히 title만 변경할 때 사용할 수 있다.
* ""인 경우에는 heigth = 0 인 되어서 표시되지 않는다.
* 배경색을 변경하고자 하는 경우에는 footerViewForSection()을 통해서 변경할 수 있다.
*/
import Foundation
import UIKit

import XCPlayground

/*:
Prepare for key window and live view
*/
var window : UIWindow! = UIWindow(frame: CGRect(x: 0.0, y: 0.0, width: 320, height: 480))
window.backgroundColor = [#Color(colorLiteralRed: 1, green: 0, blue: 0, alpha: 1)#]
window.makeKeyAndVisible()
XCPlaygroundPage.currentPage.liveView = UIApplication.sharedApplication().keyWindow!
print(UIApplication.sharedApplication().keyWindow!)

class MyCell: UITableViewCell {
    // cell style을 변경하기 위해서 override 했다.
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .Subtitle, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class TableViewController: UITableViewController {

    let cellIdentifier = "Cell"
    let headerIdentifier = "Header"

    let cellImage = [#Image(imageLiteral: "people.user_simple 64.png")#]
    /*:
    ## override UIViewController method
    */
    override func viewDidLoad() {
        print ("viewDidLoad")

        super.viewDidLoad()

        self.tableView.registerClass(MyCell.self, forCellReuseIdentifier: cellIdentifier)
        self.tableView.registerClass(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: headerIdentifier)

        // 줄의 좌우 여백을 준다.
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15)

        self.tableView.backgroundColor = [#Color(colorLiteralRed: 0, green: 1, blue: 0, alpha: 1)#]

        //
        // tableView(_: viewForHeaderInSection:)을 사용하는 경우에는 height를 지정해 주어야 보인다.
        //
        self.tableView.sectionHeaderHeight = 30
    }

    /*:
    ## UITableViewDelegate protocol
    */
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerView = tableView.dequeueReusableHeaderFooterViewWithIdentifier(headerIdentifier)

        if headerView == nil {
            headerView = UITableViewHeaderFooterView(reuseIdentifier: headerIdentifier)
        }

        // contentView, backgroundView 등의 설정을 변경하지 않으면
        // table view의 backgroundColor를 따라간다.
        headerView!.textLabel?.text = "Header \(section)"

        return headerView
    }

    /*:
    ## UITableViewDataSource protocol
    */
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)

        // one-time configuration
        cell.imageView?.image = cellImage
        cell.textLabel?.text = "textLabel \(indexPath.section)-\(indexPath.row)"
        cell.detailTextLabel?.text = "detailTextLabel"

        return cell
    }

    override func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {

        let footerView = tableView.footerViewForSection(section)
        footerView?.backgroundView?.backgroundColor = [#Color(colorLiteralRed: 1, green: 0, blue: 1, alpha: 1)#]

        return "Footer \(section)"
    }
}

/*:
Show
*/
let tableViewController = TableViewController(style: .Plain)
UIApplication.sharedApplication().keyWindow!.rootViewController = tableViewController





