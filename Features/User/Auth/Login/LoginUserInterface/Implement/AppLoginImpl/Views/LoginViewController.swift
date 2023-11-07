import UIKit
import RIBs
import SnapKit
import Then
import RxCocoa
import RxSwift
import LoginUserInterface
import SuperUI
import DesignSystem
import ResourceKit

public final class LoginViewContoller: BaseViewController, LoginPresentable, LoginViewControllable {
        
    var listener: LoginListener?
        
    public var gmailCondition: Bool = false
    
    public lazy var titleLabel = MonsterAuthLabel(text: "로그인")
    
    public lazy var idTextField = MonsterTextField(placeholder: "아이디").then {
        $0.useShowHideButton = false
    }
    
    public lazy var passwordTextField = MonsterTextField(placeholder: "비밀번호").then {
        $0.useShowHideButton = true
        $0.isSecureTextEntry = true
    }
    
    public lazy var doubleButton = MonsterDoubleTextButton(title1: "비밀번호 찾기", title2: "아이디 찾기", thintColor: .black, backgroundColor: .clear)
    
    public lazy var nextButton = MonsterButton(title: "다음", backgorundColor: .gray, titleColor: .white)
    
    public var uiviewController: UIViewController {
        return self
    }

    public override init() {
        super.init()
        self.textFieldBind()
        self.buttonBind()
        self.keyboardBind()
        self.attrebute()
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        debugPrint("\(self) deinit")
    }
    
    public override func layout() {
        [
            titleLabel,
            idTextField,
            passwordTextField,
            nextButton,
            doubleButton
        ].forEach { view.addSubview($0) }

        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(24.0)
            $0.trailing.leading.equalToSuperview().inset(20.0)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(50.0)
            $0.leading.trailing.equalToSuperview().inset(20.0)
            $0.height.equalTo(58.0)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(60.0)
            $0.leading.trailing.equalToSuperview().inset(20.0)
            $0.height.equalTo(58.0)
        }
        
        nextButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(24.0)
            $0.leading.trailing.equalToSuperview().inset(20.0)
            $0.height.equalTo(48.0)
        }
        
        nextButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(48.0)
            $0.right.left.equalToSuperview().inset(20.0)
            $0.height.equalTo(48.0)
        }
        
        doubleButton.snp.makeConstraints {
            $0.leading.equalTo(passwordTextField.snp.leading)
            $0.bottom.equalTo(nextButton.snp.top).offset(-20.0)
        }
    }

    private func attrebute() {
        self.view.backgroundColor = .white
        self.view.setupHideKeyboardOnTap(disposeBag: disposeBag)
    }
    
    private func textFieldBind() {
        let idTextFieldObservable = idTextField.rx.text.orEmpty
        let passwordTextFieldObservable = passwordTextField.rx.text.orEmpty

        Observable.combineLatest(idTextFieldObservable, passwordTextFieldObservable)
            .map { idText, passwordText in
                return !idText.isEmpty && !passwordText.isEmpty
            }
            .bind(to: nextButton.rx.isEnabled)
            .disposed(by: disposeBag)

        idTextFieldObservable
            .map { text in
                text.isEmpty ? UIColor.gray : UIColor.black
            }
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] backgroundColor in
                self?.nextButton.backgroundColor = backgroundColor
            })
            .disposed(by: disposeBag)

        idTextField.rx.controlEvent(.editingChanged)
            .subscribe(onNext: { [weak self] in
                if let text = self?.idTextField.text, text.count > 30 {
                    self?.idTextField.deleteBackward()
                }
            })
            .disposed(by: disposeBag)

        idTextFieldObservable
            .subscribe(onNext: { [weak self] text in
                self?.listener?.checkGmailTextField(textfield: self?.idTextField ?? MonsterTextField())
            })
            .disposed(by: disposeBag)
    }
    
    private func keyboardBind() {
        let keyboardWillShowObservable = NotificationCenter.default.rx.notification(UIResponder.keyboardWillShowNotification)
            .map { ($0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height ?? 48 }

        let keyboardWillHideObservable = NotificationCenter.default.rx.notification(UIResponder.keyboardWillHideNotification)
            .map { _ in CGFloat(48) }

        Observable.merge(keyboardWillShowObservable)
            .subscribe(onNext: { [weak self] height in
                self?.nextButton.snp.updateConstraints {
                    $0.bottom.equalToSuperview().offset(-height)
                    $0.left.equalToSuperview()
                    $0.right.equalToSuperview()
                }
                self?.nextButton.layer.cornerRadius = 0
                UIView.animate(withDuration: 0.3) {
                    self?.view.layoutIfNeeded()
                }
            })
            .disposed(by: disposeBag)

        Observable.merge(keyboardWillHideObservable)
            .subscribe(onNext:  { [weak self] _ in
                self?.nextButton.snp.updateConstraints {
                    $0.bottom.equalToSuperview().inset(48.0)
                    $0.left.equalToSuperview().inset(20.0)
                    $0.right.equalToSuperview().inset(20.0)
                }
                self?.nextButton.layer.cornerRadius = 8.0
                UIView.animate(withDuration: 0.3) {
                    self?.view.layoutIfNeeded()
                }
            })
            .disposed(by: disposeBag)
    }

    private func buttonBind() {
        nextButton.rx.tap
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else { return }
                if let email = self.idTextField.text, let password = self.passwordTextField.text {
                    self.listener?.loginButtonDidTap(email: email, password: password)
                    self.listener?.checkPasswordTextField(textfield: self.passwordTextField)
                }
            })
            .disposed(by: disposeBag)
    }
}
