import UIKit
import SnapKit
import DesignSystem
import CommunityUserInterface
import RxSwift
import RxCocoa
import SuperUI
import SkeletonView

class PopularViewController: BaseViewController,
                             UICollectionViewDelegateFlowLayout,
                             PopularPresentable,
                             PopularViewControllable,
                             PopularListener {
    
    var listener: PopularListener?

    public var uiviewController: UIViewController {
        return self
    }

    private let items = BehaviorSubject(value: Array(repeating: "King_of_the_Seungwoo", count: 20))

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CommunityCollectionViewCell.self, forCellWithReuseIdentifier: "CommunityCollectionViewCell")
        return collectionView
    }()

    override func attribute() {
        super.attribute()
        self.listener = self
    }

    override func layout() {
        super.layout()
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        collectionView.delegate = self
    }

    override func bindViewModel() {
        super.bindViewModel()
        setupBinding()
    }
    
    private func setupBinding() {
        items
            .bind(to: collectionView.rx.items(cellIdentifier: "CommunityCollectionViewCell", cellType: CommunityCollectionViewCell.self)) { row, data, cell in
                cell.variousLabel = MonsterVariousLabel(text: data, type: .popular, timerType: .hoursAgo(4))
            }
            .disposed(by: disposeBag)

        collectionView.rx.itemSelected
            .subscribe(onNext: { indexPath in
                print(indexPath.row)
            })
            .disposed(by: disposeBag)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: UIScreen.main.bounds.size.width, height: 80)
        return size
    }
}
