import SnapKit
import UIKit
import Then
import RxCocoa
import RxSwift

final class MonsterIndicatorView: UIView {
    
    let disposeBag = DisposeBag()
    
    private var trackViewLeftInsetConstraint: Constraint?
    private var viewModel: HomeViewModel?
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .white.withAlphaComponent(0.5)
        return view
    }()
    
    private lazy var trackView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    init(viewModel: HomeViewModel) {
        super.init(frame: .zero)
        self.viewModel = viewModel
        setupUI()
        bindUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        addSubview(lineView)
        lineView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(3.0)
        }
        
        lineView.addSubview(trackView)
        trackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.greaterThanOrEqualToSuperview()
            $0.trailing.lessThanOrEqualToSuperview()
            $0.width.equalToSuperview().multipliedBy(1.0 / 4.0)
            trackViewLeftInsetConstraint = $0.left.equalToSuperview().priority(999).constraint
        }
    }
    
    private func bindUI() {
        guard let viewModel = viewModel else { return }
        
        viewModel.widthRatioObservable
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] widthRatio in
                guard let widthRatio = widthRatio, let strongSelf = self else { return }
                strongSelf.trackView.snp.remakeConstraints {
                    $0.top.bottom.equalToSuperview()
                    $0.width.equalToSuperview().multipliedBy(widthRatio)
                    $0.left.greaterThanOrEqualToSuperview()
                    $0.right.lessThanOrEqualToSuperview()
                    strongSelf.trackViewLeftInsetConstraint = $0.left.equalToSuperview().priority(999).constraint
                }
            })
            .disposed(by: disposeBag)

        viewModel.leftOffsetRatioObservable
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] leftOffsetRatio in
                guard let leftOffsetRatio = leftOffsetRatio, let strongSelf = self else { return }
                strongSelf.trackViewLeftInsetConstraint?.update(inset: leftOffsetRatio * strongSelf.bounds.width)
            })
            .disposed(by: disposeBag)
    }
}
