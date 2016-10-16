import UIKit

protocol EditorControllerDelegate: class {
    func editorControllerDidChangeToYellow(_ editorController: EditorController)
}

class EditorController: UIViewController {
    weak var delegate: EditorControllerDelegate?

    lazy var textView: UITextView = {
        let view = UITextView()
        view.delegate = self

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.textView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let parentWidth = self.view.frame.width
        let parentHeight = self.view.frame.height

        var textViewFrame: CGRect {
            return CGRect(x: 0, y: 0, width: parentWidth, height: parentHeight)
        }
        self.textView.frame = textViewFrame
    }
}

extension EditorController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.contains("yellow") {
            self.delegate?.editorControllerDidChangeToYellow(self)
        }
    }
}
