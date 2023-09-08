import UIKit
import SnapKit
import Then
import DesignSystem
import RxCocoa
import RxSwift

public protocol PageChangeable: UIViewController {
    var pagingTabBar: MonsterPagingTabBar { get }
    var viewControllers: [UIViewController] { get set }
}

public extension PageChangeable {
    func setupLayout(containerView: UIView) {
        [
            pagingTabBar,
            containerView
        ].forEach { view.addSubview($0) }

        pagingTabBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(pagingTabBar.cellHeight)
        }

        containerView.snp.makeConstraints {
            $0.top.equalTo(pagingTabBar.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }

    func bindEvents(containerView: UIView, disposeBag: DisposeBag) {
        var currentVC: UIViewController?

        pagingTabBar.selectedIndex.subscribe(onNext: { [weak self] index in
           guard let self = self else { return }

           if let currentVC = currentVC {
               currentVC.willMove(toParent: nil)
               currentVC.view.removeFromSuperview()
               currentVC.removeFromParent()
           }

           let vcToAdd = self.viewControllers[index]

           self.addChild(vcToAdd)

           vcToAdd.view.frame = containerView.bounds

           containerView.addSubview(vcToAdd.view)

           vcToAdd.didMove(toParent: self)

       }).disposed(by: disposeBag)
   }
}
