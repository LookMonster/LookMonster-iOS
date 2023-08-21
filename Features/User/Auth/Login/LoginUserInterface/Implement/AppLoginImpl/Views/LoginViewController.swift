import UIKit
import RIBs
import SnapKit
import Then
import RxCocoa
import RxSwift
import Kingfisher
import LoginUserInterface

public final class LoginViewContoller: UIViewController, LoginPresentable, LoginViewControllable {
        
    var listener: LoginListener?
        
    public var uiviewController: UIViewController {
        return self
    }

    public let loginVIew = LoginView()
    
    private var disposeBag = DisposeBag()
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        self.bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        debugPrint("\(self) deinit")
    }
    
    private func bind() {
        self.view.backgroundColor = .red
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
    }
}
