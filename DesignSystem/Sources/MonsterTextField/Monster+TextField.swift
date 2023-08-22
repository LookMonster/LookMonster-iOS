//
//  Monster+TextField.swift
//  DesignSystemDemoApp
//
//  Created by 박준하 on 2023/08/22.
//

import UIKit
import Then
import SnapKit

class MonsterTextField: UITextField {
    private let placeholderLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = UIColor.gray
    }
    private let underlineView = UIView().then {
        $0.backgroundColor = UIColor.black
    }

    override var placeholder: String? {
        didSet {
            placeholderLabel.text = placeholder
            super.placeholder = ""
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
        configure()
        delegate = self
    }

    private func configure() {
        addSubview(placeholderLabel)
        addSubview(underlineView)
        
        placeholderLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(underlineView.snp.top).offset(-4)
            $0.height.equalToSuperview().multipliedBy(0.7)
        }

        underlineView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}

extension MonsterTextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3) {
            self.placeholderLabel.font = UIFont.systemFont(ofSize: 12)
            self.placeholderLabel.snp.updateConstraints {
                $0.bottom.equalTo(self.underlineView.snp.top).offset(-(self.placeholderLabel.frame.size.height + 4))
            }
            self.layoutIfNeeded()
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3) {
            self.placeholderLabel.font = UIFont.systemFont(ofSize: 16)
            self.placeholderLabel.snp.updateConstraints {
                $0.bottom.equalTo(self.underlineView.snp.top).offset(-4)
            }
            self.layoutIfNeeded()
        }
    }
}
