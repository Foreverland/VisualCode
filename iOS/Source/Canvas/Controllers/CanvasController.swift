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

    func addView() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.backgroundColor = .red
        view.tag = 1
        self.canvasView.addSubview(view)

        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handleGesture))
        gestureRecognizer.maximumNumberOfTouches = 1
        gestureRecognizer.minimumNumberOfTouches = 1
        gestureRecognizer.cancelsTouchesInView = false
        self.canvasView.addGestureRecognizer(gestureRecognizer)
    }

    func handleGesture(gesture: UIPanGestureRecognizer) {
        guard let view = gesture.view else { return }

        let translation = gesture.translation(in: self.canvasView)

        let newXOrigin = view.frame.minX + translation.x
        let newYOrigin = view.frame.minY + translation.y

        view.frame = CGRect(x: newXOrigin, y: newYOrigin, width: view.frame.width, height: view.frame.height)

        gesture.setTranslation(CGPoint.zero, in: self.canvasView)
    }
}
