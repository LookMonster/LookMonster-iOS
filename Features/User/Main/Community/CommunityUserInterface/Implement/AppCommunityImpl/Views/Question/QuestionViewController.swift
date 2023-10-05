import UIKit
import SnapKit
import DesignSystem
import CommunityUserInterface
import RxCocoa
import RxSwift
import ResourceKit
import SuperUI

class QuestionViewController: BaseViewController,
                              QuestionPresentable,
                              QuestionViewControllable,
                              QuestionListener,
                              UICollectionViewDelegateFlowLayout {
    
    var listener: QuestionListener?
    
    public var uiviewController: UIViewController {
        return self
    }
    
    private let items = BehaviorSubject(value: Array(repeating: "King_of_the_junha", count: 0))
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items.subscribe(onNext: { [weak self] items in
            if items.isEmpty {
                self?.collectionView.setEmptyMessage("아직 게시물이 없어요.", image: ResourceKitAsset.memoXIcon.image)
            } else {
                self?.collectionView.restore()
            }
        }).disposed(by: disposeBag)
    }
    
    override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBinding() {
        
        items.bind(to:
                    collectionView.rx.items(cellIdentifier:"CommunityCollectionViewCell",
                                            cellType: CommunityCollectionViewCell.self)) { row , data , cell in
            
            cell.variousLabel = MonsterVariousLabel(text:data , type: .question , timerType:.hoursAgo(4))
            
        }.disposed(by:self.disposeBag)
        
        collectionView.rx.itemSelected.subscribe(onNext:{ indexPath in
            
            print(indexPath.row)
            
        }).disposed(by:self.disposeBag)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let size = CGSize(width: UIScreen.main.bounds.size.width, height: 80)
        return size
    }
}
