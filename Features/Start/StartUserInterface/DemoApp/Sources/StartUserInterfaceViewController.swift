import UIKit
import Then
import ResourceKit
import SnapKit
import SuperUI
import RxSwift
import RxCocoa

final class StartUserInterfaceViewController: BaseViewController {
    private let imageOptions: [UIImage] = [ResourceKitAsset.sBackground1.image]
    private let currentImageRelay = BehaviorRelay<UIImage?>(value: nil)
    
    private let gradientView = UIView()
    
    private let backgroundImageView = UIImageView().then {
        $0.image = ResourceKitAsset.sBackground1.image
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    private let whiteLogoButton = UIButton().then {
        $0.setImage(ResourceKitAsset.wLogo.image, for: .normal)
    }
    
    private let logoNameLabelButton = UIButton().then {
        $0.setTitle("LOOK MONSTER", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 40.0, weight: .black)
    }
    
    private let googleLoginButton = AuthButton(image: ResourceKitAsset.googleIcon.image, title: "Google로 시작하기", backgorundColor: .white, titleColor: .black)
    
    private let appleLoginButton = AuthButton(image: ResourceKitAsset.appleIcon.image, title: "apple로 시작하기", backgorundColor: .black, titleColor: .white)
    
    private let startWithEmailButton = UIButton().then {
        $0.setTitle("이메일로 시작하기", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.backgroundColor = .clear
    }

    private let loginWithEmailButton = UIButton().then {
        $0.setTitle("이메일로 로그인", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.backgroundColor = .clear
    }

    override func layout() {
        super.layout()
        setupViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayRandomImage()
        setupEmailButtons()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        setupBindings()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupGradient()
    }
    
    private func setupViews() {
        view.addSubviews([backgroundImageView,
                          gradientView,
                          whiteLogoButton,
                          logoNameLabelButton,
                          googleLoginButton,
                          appleLoginButton
                         ])
        
        backgroundImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(40.0).priority(.low)
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        gradientView.snp.makeConstraints {
            $0.edges.equalTo(backgroundImageView)
        }
        
        whiteLogoButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(412.0)
            $0.leading.equalToSuperview().offset(24.0)
            $0.height.width.equalTo(120.0)
        }
        
        logoNameLabelButton.snp.makeConstraints {
            $0.top.equalTo(whiteLogoButton.snp.bottom)
            $0.leading.equalTo(whiteLogoButton.snp.leading)
        }
        
        googleLoginButton.snp.makeConstraints {
            $0.top.equalTo(logoNameLabelButton.snp.bottom).offset(40.0)
            $0.leading.trailing.equalToSuperview().inset(24.0)
            $0.height.equalTo(48.0)
        }
        
        appleLoginButton.snp.makeConstraints {
            $0.top.equalTo(googleLoginButton.snp.bottom).offset(12.0)
            $0.leading.trailing.equalToSuperview().inset(24.0)
            $0.height.equalTo(48.0)
        }
    }
    
    
    private func displayRandomImage() {
        let randomImage = imageOptions.randomElement()
        currentImageRelay.accept(randomImage)
    }
    
    
    private func setupBindings() {
        currentImageRelay
            .bind(to: backgroundImageView.rx.image)
            .disposed(by: disposeBag)
        
        whiteLogoButton.rx.tap
            .subscribe(with: self, onNext: { owner, _ in
                owner.handleButtonTap(sender: owner.whiteLogoButton)
            })
            .disposed(by: disposeBag)
        
        logoNameLabelButton.rx.tap
            .subscribe(with: self, onNext: { owner, _ in
                owner.handleButtonTap(sender: owner.logoNameLabelButton)
            })
            .disposed(by: disposeBag)
    }
    
    private func setupGradient() {
        let gradient = CAGradientLayer()
        let startColor = UIColor.clear.cgColor
        let endColor = UIColor.black.cgColor
        
        gradient.frame = gradientView.bounds
        
        gradient.endPoint = CGPoint(x: 0.5, y: 1.7)
        
        gradient.colors = [startColor, endColor]
        
        gradientView.layer.insertSublayer(gradient, at: 0)
        
        gradientView.backgroundColor = .clear
    }
    
    private func setupEmailButtons() {
        let emailButtonStack = UIStackView().then {
            $0.axis = .horizontal
            $0.spacing = 40
            $0.addArrangedSubview(startWithEmailButton)
            $0.addArrangedSubview(loginWithEmailButton)
        }
        
        view.addSubview(emailButtonStack)
        
        emailButtonStack.snp.makeConstraints {
            $0.top.equalTo(appleLoginButton.snp.bottom).offset(36.0)
            $0.centerX.equalToSuperview()
        }

        startWithEmailButton.snp.makeConstraints {
            $0.height.equalTo(40)
        }

        loginWithEmailButton.snp.makeConstraints {
            $0.height.equalTo(40)
        }

        startWithEmailButton.rx.tap
            .subscribe(onNext: { [weak self] in
                print("startWithEmailButton pressed.")
                self?.handleStartWithEmail()
            })
            .disposed(by: disposeBag)

        loginWithEmailButton.rx.tap
            .subscribe(onNext: { [weak self] in
                print("loginWithEmailButton pressed.")
                self?.handleLoginWithEmail()
            })
            .disposed(by: disposeBag)
    }
    
    private func handleStartWithEmail() {
    }

    private func handleLoginWithEmail() {
    }
    
    private func handleButtonTap(sender: UIButton) {
        if sender == whiteLogoButton {
            print("whiteLogoButton tapped")
        } else if sender == logoNameLabelButton {
            print("LogoNameLabelButton tapped")
        }
    }
    
}

