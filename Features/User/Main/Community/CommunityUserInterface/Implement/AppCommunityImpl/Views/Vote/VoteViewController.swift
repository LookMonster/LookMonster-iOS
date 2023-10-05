import UIKit
import DesignSystem
import CommunityUserInterface
import RxSwift
import RxCocoa
import SuperUI

class VoteViewController: BaseViewController, UICollectionViewDelegateFlowLayout, VotePresentable, VoteViewControllable, VoteListener  {
    
    var listener: VoteListener?
    
    public var uiviewController: UIViewController {
        return self
    }
    
    private let items = BehaviorSubject(value: Array(repeating: "King_of_the_junha", count: 20))
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CommunityCollectionViewCell.self,
                                forCellWithReuseIdentifier:"CommunityCollectionViewCell")
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
        self.collectionView.delegate = self
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        setupBinding()
    }

    private func setupBinding() {
        items.bind(to:
                    collectionView.rx.items(cellIdentifier:"CommunityCollectionViewCell",
                                            cellType: CommunityCollectionViewCell.self)) { row , data , cell in
            
            cell.variousLabel = MonsterVariousLabel(text: data , type: .vote , timerType: .weeksAgo(2))
            
        }.disposed(by:self.disposeBag)
        
        collectionView.rx.itemSelected.subscribe(onNext:{ indexPath in
            
            print(indexPath.row)
            
        }).disposed(by: self.disposeBag)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let size = CGSize(width: UIScreen.main.bounds.size.width, height: 80)
        return size
    }
    
}
