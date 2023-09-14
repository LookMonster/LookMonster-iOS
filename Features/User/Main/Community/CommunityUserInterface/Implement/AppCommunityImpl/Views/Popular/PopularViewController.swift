import UIKit
import SnapKit
import DesignSystem
import CommunityUserInterface
import RxSwift
import RxCocoa
import SuperUI

class PopularViewController: BaseViewController, UICollectionViewDelegateFlowLayout, PopularPresentable, PopularViewControllable, PopularListener {
    
    var listener: PopularListener?
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        setupBinding()
        
        self.collectionView.delegate = self
    }
    
    init() {
        super.init(nibName:nil , bundle:nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func communityBackground() {
        print("asdf")
    }
    
    private func setupBinding() {
        
        items.bind(to:
                    collectionView.rx.items(cellIdentifier:"CommunityCollectionViewCell",
                                            cellType: CommunityCollectionViewCell.self)) { row , data , cell in
            
            cell.variousLabel = MonsterVariousLabel(text:data , type: .popular , timerType:.hoursAgo(4))
            
        }.disposed(by:self.disposeBag)
        
        collectionView.rx.itemSelected.subscribe(onNext:{ [weak self] indexPath in
            
            print(indexPath.row)
            
        }).disposed(by:self.disposeBag)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let size = CGSize(width: UIScreen.main.bounds.size.width, height: 80)
        return size
    }
}

