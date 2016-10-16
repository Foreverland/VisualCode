import UIKit

class CanvasController: UIViewController {
    lazy var canvasView: UIView = {
        let view = UIView()

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .blue
        self.view.addSubview(self.canvasView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let parentWidth = self.view.frame.width
        let parentHeight = self.view.frame.height

        var canvasViewFrame: CGRect {
            let navigationBarHeight = self.navigationController?.navigationBar.frame.size.height ?? 0
            let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
            let topMargin = navigationBarHeight + statusBarHeight

            return CGRect(x: 0, y: topMargin, width: parentWidth, height: parentHeight - topMargin)
        }
        self.canvasView.frame = canvasViewFrame
    }
}
