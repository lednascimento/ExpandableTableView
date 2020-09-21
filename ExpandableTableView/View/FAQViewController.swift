import UIKit

protocol FAQViewControllerProtocol: AnyObject {
    func showView(withFAQs faqs: [FAQModel])
    func showErrorView(withError error: Error)
    func showEmptyView()
}

final class FAQViewController: UIViewController {

    private var customView: ExpandableView {
        return view as! ExpandableView
    }

    private let presenter: FAQPresenterProtocol?

    init(presenter: FAQPresenterProtocol?) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = ExpandableView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "FAQ"
        presenter?.fetchQuestions()
    }
}

extension FAQViewController: FAQViewControllerProtocol {
    func showView(withFAQs faqs: [FAQModel]) {
        customView.update(withFAQs: faqs)
    }

    func showErrorView(withError error: Error) {}

    func showEmptyView() {}
}
