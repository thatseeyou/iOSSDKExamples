import UIKit

public class UIViewControllerTrace: UIViewController {
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK:- UITraitEnvironment events

    override public func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        enterEventTrace()
        super.traitCollectionDidChange(previousTraitCollection)
        exitEventTrace()
    }

    // MARK:- UIContentContainer events

    override public func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        enterEventTrace()
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        exitEventTrace()
    }

    override public func willTransitionToTraitCollection(newCollection: UITraitCollection, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        enterEventTrace()
        super.willTransitionToTraitCollection(newCollection, withTransitionCoordinator: coordinator)
        exitEventTrace()
    }

    // MARK:- UIViewController

    override public func viewDidLoad() {
        enterEventTrace()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        exitEventTrace()
    }

    override public func updateViewConstraints() {
        enterEventTrace()
        super.updateViewConstraints()
        exitEventTrace()
    }
    override public func viewWillLayoutSubviews() {
        enterEventTrace()
        super.viewWillLayoutSubviews()
        exitEventTrace()
    }
    override public func viewDidLayoutSubviews() {
        enterEventTrace()
        super.viewDidLayoutSubviews()
        exitEventTrace()
    }

    override public func willMoveToParentViewController(parent: UIViewController?) {
        enterEventTrace()
        super.willMoveToParentViewController(parent)
        exitEventTrace()
    }
    override public func didMoveToParentViewController(parent: UIViewController?) {
        enterEventTrace()
        super.didMoveToParentViewController(parent)
        exitEventTrace()
    }

    override public func viewWillAppear(animated: Bool) {
        enterEventTrace()
        super.viewWillAppear(animated)

        if self.isBeingPresented() {

        }
        if self.isBeingDismissed() {

        }
        if self.isMovingFromParentViewController() {

        }
        if self.isMovingToParentViewController() {

        }
        exitEventTrace()
    }
    override public func viewDidAppear(animated: Bool) {
        enterEventTrace()
        super.viewDidAppear(animated)
        exitEventTrace()
    }
    override public func viewWillDisappear(animated: Bool) {
        enterEventTrace()
        super.viewWillDisappear(animated)

        if self.isBeingPresented() {

        }
        if self.isBeingDismissed() {

        }
        if self.isMovingFromParentViewController() {

        }
        if self.isMovingToParentViewController() {

        }
        exitEventTrace()
    }
    override public func viewDidDisappear(animated: Bool) {
        enterEventTrace()
        super.viewDidDisappear(animated)
        exitEventTrace()
    }
    
}
