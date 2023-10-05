import UIKit
import RxCocoa
import RxSwift
import Then
import SnapKit

open class BaseCollectionViewCell: UICollectionViewCell {
    open var disposebag = DisposeBag()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        self.attribute()
        self.layout()
        self.bind()
    }
    
    open func bind() { }
    open func layout() { }
    open func attribute() { }
    
}
