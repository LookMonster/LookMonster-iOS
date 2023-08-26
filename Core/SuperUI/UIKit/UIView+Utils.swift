import UIKit
import RxCocoa
import RxSwift

public extension UIView {
    func addShadowWithRoundedCorners(
        _ radius: CGFloat = 16,
        shadowColor: CGColor = UIColor.black.cgColor,
        opacity: Float = 0.1
    ) {
        self.layer.cornerCurve = .continuous
        self.layer.masksToBounds = false
        self.layer.shadowColor = shadowColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = 2.5
        self.layer.cornerRadius = radius
    }
    
    func roundCorners(
        _ radius: CGFloat = 16
    ) {
        self.layer.cornerCurve = .continuous
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func addSubviews(_ viewsToAdd: [UIView]) {
        viewsToAdd.forEach({addSubview($0)})
    }
    
    func setupHideKeyboardOnTap(disposeBag: DisposeBag) {
        let tapGesture = UITapGestureRecognizer()
        self.addGestureRecognizer(tapGesture)

        tapGesture.rx.event
            .subscribe(onNext: { [weak self] _ in
                self?.endEditing(true)
            })
            .disposed(by: disposeBag)
    }
}
