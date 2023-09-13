import UIKit
import DesignSystem
import CommunityUserInterface

class VoteViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, VotePresentable, VoteViewControllable, VoteListener  {
    
    var listener: VoteListener?
    
    public var uiviewController: UIViewController {
        return self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView!.register(CommunityCollectionViewCell.self, forCellWithReuseIdentifier: "CommunityCollectionViewCell")
    }
    
    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func communityBackground() {
        print("asdf")
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CommunityCollectionViewCell", for: indexPath) as? CommunityCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.variousLabel = MonsterVariousLabel(text: "King_of_the_junha", type: .vote, timerType: .hoursAgo(4))
        
        return cell
    }
        
    override func collectionView(_ collectionView :UICollectionView , didSelectItemAt indexPath :IndexPath){
        print(indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let size = CGSize(width: UIScreen.main.bounds.size.width, height: 80)
        return size
    }
    
}
