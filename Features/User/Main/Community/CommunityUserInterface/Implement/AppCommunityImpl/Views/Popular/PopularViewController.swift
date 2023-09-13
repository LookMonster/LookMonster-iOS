import UIKit
import SnapKit
import CommunityUserInterface

class PopularViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, PopularPresentable, PopularViewControllable, PopularListener {
    
    var listener: PopularListener?
    
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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func communityBackground() {
        print("asdf")
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CommunityCollectionViewCell", for:indexPath)
        
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

