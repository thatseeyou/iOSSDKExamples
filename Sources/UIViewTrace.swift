import UIKit

public class UIViewTrace: UIView {
    // MARK:- UITraitEnvironment events
    override public func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        enterEventTrace()
        super.traitCollectionDidChange(previousTraitCollection)
        exitEventTrace()
    }

    // MARK:- UIView events
    override public func drawRect(rect: CGRect) {
        enterEventTrace()
        super.drawRect(rect)
        exitEventTrace()
    }

    override public func updateConstraints() {
        enterEventTrace()
        super.updateConstraints()
        exitEventTrace()
    }

    override public func layoutSubviews() {
        enterEventTrace()
        super.layoutSubviews()
        exitEventTrace()
    }

    override public func didAddSubview(subview: UIView) {
        enterEventTrace()
        super.didAddSubview(subview)
        exitEventTrace()
    }
    override public func willRemoveSubview(subview: UIView) {
        enterEventTrace()
        super.willRemoveSubview(subview)
        exitEventTrace()
    }
    override public func willMoveToSuperview(newSuperview: UIView?) {
        enterEventTrace()
        super.willMoveToSuperview(newSuperview)
        exitEventTrace()
    }
    override public func didMoveToSuperview() {
        enterEventTrace()
        super.didMoveToSuperview()
        exitEventTrace()
    }
    override public func willMoveToWindow(newWindow: UIWindow?) {
        enterEventTrace()
        super.willMoveToWindow(newWindow)
        exitEventTrace()
    }
    override public func didMoveToWindow() {
        enterEventTrace()
        super.didMoveToWindow()
        exitEventTrace()
    }
}
