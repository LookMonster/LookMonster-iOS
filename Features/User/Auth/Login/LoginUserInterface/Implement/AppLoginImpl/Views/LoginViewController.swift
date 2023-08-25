import UIKit
import RIBs
import SnapKit
import Then
import RxCocoa
import RxSwift
import Kingfisher
import LoginUserInterface
import SuperUI
import DesignSystem
import ResourceKit

public final class LoginViewContoller: UIViewController, LoginPresentable, LoginViewControllable {
        
    var listener: LoginListener?
    private var disposeBag = DisposeBag()
    
    public lazy var pageControl = MonsterPageControl().then {
        $0.numberOfPages = 4
        $0.currentPage = 0
    }
    
    public lazy var titleLabel = MonsterAuthLabel(text: "회원가입을 위해\n이메일을 입력해 주세요")
    
    public lazy var emailTextField = MonsterTextField(placeholder: "이메일").then {
        $0.useShowHideButton = false
    }
    
    public lazy var nextButton = MonsterButton(title: "다음", backgorundColor: .gray, titleColor: .white)
    
    public var uiviewController: UIViewController {
        return self
    }

    public let loginView = LoginView()
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        pageControl.configurePageControl()
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        self.bind()
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        debugPrint("\(self) deinit")
    }
    
    public func layout() {
        view.addSubview(pageControl)
        view.addSubview(titleLabel)
        view.addSubview(emailTextField)
        view.addSubview(nextButton)
        
        pageControl.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().offset(5.0)
            $0.height.equalTo(24.0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(pageControl.snp.bottom).offset(20.0)
            $0.trailing.leading.equalToSuperview().inset(20.0)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(42.0)
            $0.leading.trailing.equalToSuperview().inset(20.0)
            $0.height.equalTo(58.0)
        }
        
        nextButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(24.0)
            $0.leading.trailing.equalToSuperview().inset(20.0)
            $0.height.equalTo(48.0)
        }
    }

    
    private func bind() {
        self.view.backgroundColor = .white

        let inputTextObservable = emailTextField.rx.text.orEmpty
        
        inputTextObservable
            .map { !$0.isEmpty }
            .bind(to: nextButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        inputTextObservable
            .map { text in
                text.isEmpty ? UIColor.gray : UIColor.black
            }
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] backgroundColor in
                self?.nextButton.backgroundColor = backgroundColor
            })
            .disposed(by: disposeBag)
        
        nextButton.rx.tap
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else { return }
                if let email = self.emailTextField.text {
                    self.listener?.loginButtonDidTap(email: email)
                }
            })
            .disposed(by: disposeBag)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
            self.view.endEditing(true)
   }
}
