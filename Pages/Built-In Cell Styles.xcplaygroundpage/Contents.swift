/*:
# UITableViewCell의 Style
* 기본으로 제공하는 style을 확인한다.
* Custom style을 사용하는 경우에 contentView에 subview를 추가한다.
*/
import Foundation
import UIKit

import XCPlayground

/*:
Prepare for key window and live view
*/
var window : UIWindow! = UIWindow(frame: CGRect(x: 0.0,
    y: 0.0, width: 320, height: 480))
window.backgroundColor = [#Color(colorLiteralRed: 1, green: 0, blue: 0, alpha: 1)#]
window.makeKeyAndVisible()
XCPlaygroundPage.currentPage.liveView = UIApplication.sharedApplication().keyWindow!
//print(UIApplication.sharedApplication().keyWindow!)

class TableViewController: UITableViewController {

    let cellIdentifiers = ["Cell0", "Cell1", "Cell2", "Cell3", "Cell4"]
    let cellStyles:[UITableViewCellStyle] = [.Default, .Subtitle, .Value1, .Value2, .Default]
    let sectionHeaders = ["Default", "Subtitle", "Value1", "Value2", "Custom"]

    let cellImage = [#Image(imageLiteral: "people.user_simple 64.png")#]
/*:
## override UIViewController method
*/
    override func viewDidLoad() {
        print ("viewDidLoad")

        super.viewDidLoad()
    }

/*:
## UITableViewDelegate protocol
*/

/*:
## UITableViewDataSource protocol
*/
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 5
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 4 ? 2 : 1
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeaders[section]
    }

/*:
UITableViewCell에서 제공하는 기본 스타일에서 사용하는 속성들

* contentView
    - textLabel
    - detailTextLabel
    - imageView


* accessoryView
    - accessoryType : accessoryView = nil 이면 참조

*/
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let section = indexPath.section

        var cell : UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifiers[section])

        if cell == nil {
            // section에 따라서 다른 cell
            cell = UITableViewCell(style:cellStyles[section], reuseIdentifier:cellIdentifiers[section])

            if section == 4 {
                cell.backgroundColor = [#Color(colorLiteralRed: 0, green: 0, blue: 1, alpha: 1)#]

                let view = UIView(frame: CGRectMake(0, 0, 100, 100))
                view.backgroundColor = [#Color(colorLiteralRed: 1, green: 0.5, blue: 0, alpha: 1)#].colorWithAlphaComponent(0.5)
                cell.contentView.addSubview(view)

                // 2. accessoryType
                cell.accessoryType = .DetailButton
            }
            else {
                // 1-3. imageView
                cell.imageView?.image = cellImage

                // 2. accessoryType
                cell.accessoryType = .DetailButton
            }
        }

        if section != 4 {
            cell.textLabel?.text = "textLabel at \(indexPath.row)"
            cell.detailTextLabel?.text = "detailTextLabel at \(indexPath.row)"
        }

        return cell
    }
}

/*:
Show
*/
let tableViewController = TableViewController(style: .Plain)
UIApplication.sharedApplication().keyWindow!.rootViewController = tableViewController





