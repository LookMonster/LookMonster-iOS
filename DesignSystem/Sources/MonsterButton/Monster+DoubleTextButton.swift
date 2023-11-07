//
//  Monster+DoubleTextButton.swift
//  DesignSystem
//
//  Created by 박준하 on 11/7/23.
//

import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

public class MonsterDoubleTextButton: UIView {

    private let firstButton = UIButton().then {
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .black)
        $0.layer.cornerRadius = 5
    }

    private let separatorLabel = UILabel().then {
        $0.text = "|"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 16.0, weight: .black)
    }

    private let secondButton = UIButton().then {
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .black)
        $0.layer.cornerRadius = 5
    }

    public let disposeBag = DisposeBag()
    
    public var greetingObservable: Observable<Void> {
        return firstButton.rx.tap.asObservable()
    }

    public var farewellObservable: Observable<Void> {
        return secondButton.rx.tap.asObservable()
    }

    public init(title1: String, title2: String, thintColor: UIColor, backgroundColor: UIColor) {
        super.init(frame: .zero)
        firstButton.setTitle(title1, for: .normal)
        secondButton.setTitle(title2, for: .normal)
        firstButton.backgroundColor = backgroundColor
        secondButton.backgroundColor = backgroundColor
        firstButton.setTitleColor(thintColor, for: .normal)
        secondButton.setTitleColor(thintColor, for: .normal)
        setupUI()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        [firstButton,separatorLabel,secondButton].forEach { self.addSubview($0) }
    }

    private func setupConstraints() {
        firstButton.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
            $0.trailing.equalTo(separatorLabel.snp.leading).offset(-8)
        }

        separatorLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }

        secondButton.snp.makeConstraints {
            $0.trailing.top.bottom.equalToSuperview()
            $0.leading.equalTo(separatorLabel.snp.trailing).offset(8)
        }
    }
}
