/*:
# UIRefreshControl

* UITableView가 아닌 UITableViewController에서 지원한다.
* refreshControl 속성을 지정하면 된다.
*/
import Foundation
import UIKit

class TableViewController: UITableViewController {

    let cellIdentifier = "Cell"

    let cellImage = [#Image(imageLiteral: "people.user_simple 64.png")#]
    /*:
    ## override UIViewController method
    */
    override func viewDidLoad() {
        print ("viewDidLoad")

        super.viewDidLoad()

        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)

        // 줄의 좌우 여백을 준다.
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15)

        self.tableView.backgroundColor = [#Color(colorLiteralRed: 0, green: 1, blue: 0, alpha: 1)#]

        // UIRefreshControl
        self.refreshControl = UIRefreshControl()
        self.refreshControl!.addTarget(self, action: "doRefresh", forControlEvents: .ValueChanged)
    }

    /*:
    ## UITableViewDelegate protocol
    */

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

    func doRefresh(sender: UIRefreshControl) {
        print("doRefresh")
    }

    func simulateUserInput() {
        self.tableView.setContentOffset(CGPointMake(0, -self.refreshControl!.bounds.height), animated: true)
        // 실제 환경에서는 아래의 코드는 자동으로 호출된다.
        self.refreshControl!.beginRefreshing()
        self.doRefresh(self.refreshControl!)
    }
}

let viewController = TableViewController(style: .Plain)
PlaygroundHelper.showViewController(viewController)

Utility.runActionAfterTime(1.0) {
    viewController.simulateUserInput()
}
Utility.runActionAfterTime(5.0) {
    viewController.refreshControl!.endRefreshing()
}


