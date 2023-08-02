import RIBs
import UIKit
import FinanceUserInterface

protocol CardOnFileDashboardPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func didTapAddPaymentMethod()
}

final class CardOnFileDashboardViewController: UIViewController, CardOnFileDashboardPresentable, CardOnFileDashboardViewControllable {
    
    weak var listener: CardOnFileDashboardPresentableListener?
    
    private let headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.text = "카드 및 계좌"
        return label
    }()
    
    private lazy var seeAllButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("전체보기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(seeAllButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private let cardOnFileStackview: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.alignment = .fill
        stackview.distribution = .equalSpacing
        stackview.axis = .vertical
        stackview.spacing = 12
        return stackview
    }()
    
    private lazy var addMethodButton: AddPaymentMethodButton = {
        let button = AddPaymentMethodButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.roundCorners()
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(addButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with viewModels: [PaymentMethodViewModel]) {
        
        cardOnFileStackview.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        let views = viewModels.map(PaymentMethodView.init)
        
        views.forEach {
            $0.roundCorners()
            cardOnFileStackview.addArrangedSubview($0)
        }
        
        cardOnFileStackview.addArrangedSubview(addMethodButton)
        
        let heightConstraints = views.map { $0.heightAnchor.constraint(equalToConstant: 60) }
        NSLayoutConstraint.activate(heightConstraints)
    }
    
    private func setupView() {
        view.addSubview(headerStackView)
        view.addSubview(cardOnFileStackview)
        
        
        headerStackView.addArrangedSubview(titleLabel)
        headerStackView.addArrangedSubview(seeAllButton)
        
        
        cardOnFileStackview.addArrangedSubview(addMethodButton)
        
        
        
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            headerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            cardOnFileStackview.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 10),
            cardOnFileStackview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cardOnFileStackview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cardOnFileStackview.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            addMethodButton.heightAnchor.constraint(equalToConstant: 60),
            
        ])
    }
    
    @objc
    func seeAllButtonDidTap() {
        
    }
    
    @objc
    private func addButtonDidTap() {
        listener?.didTapAddPaymentMethod()
    }

}
