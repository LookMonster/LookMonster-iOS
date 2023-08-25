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
        $0.pageIndicatorTintColor = ResourceKitAsset.gray200.color
        $0.currentPageIndicatorTintColor = UIColor.black
    }
    
    public lazy var titleLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 32.0, weight: .bold)
        $0.textColor = UIColor.black
        $0.textAlignment = .left
        $0.numberOfLines = 2
        $0.text = "회원가입을 위해\n이메일을 입력해 주세요"
    }
    
    public lazy var emailTextField = MonsterTextField().then {
        $0.placeholder = "이메일"
        $0.useShowHideButton = false
    }
    
    public lazy var nextButton = MonsterButton(title: "다음", backgorundColor: .black, titleColor: .white).then {
        $0.isEnabled = false
        $0.backgroundColor = .gray
    }

    public var uiviewController: UIViewController {
        return self
    }

    public let loginVIew = LoginView()
    
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
        self.view.addSubview(pageControl)
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
//        profileView.rx.selectButtonTapped
//            .subscribe(onNext: { [weak self] _ in
//                guard let imageType = self?.profileView.currentProfileImage.profileImageType else { return }
//                self?.listener?.didTapSelectButton(with: imageType.rawValue)
//            })
//            .disposed(by: disposeBag)
//
//        self.rx.didTapDimmedView
//            .subscribe(onNext: { [weak self] _ in
//                self?.listener?.didTapDimmedView()
//            })
//            .disposed(by: disposeBag)
        
        
        let inputTextObservable = emailTextField.rx.text.orEmpty
        let isButtonEnabled = BehaviorRelay(value: false)

        
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
            .subscribe(with: self, onNext: { owner, _  in
                print("asdf")
            }).disposed(by: disposeBag)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
            self.view.endEditing(true)
   }
}
