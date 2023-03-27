//
//  ShadowButton.swift
//  TheWallet
//
//  Created by Roman on 31.12.2022.
//

import UIKit

@IBDesignable
final class ShadowButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        viewSetup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        viewSetup()
    }

    func viewSetup() {
        self.layer.cornerRadius = 14
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 8.33, height: 8.33)
        self.layer.shadowRadius = 12
        self.layer.shadowColor = UIColor(red: 0.008, green: 0.008, blue: 0.275, alpha: 0.1).cgColor
            // self.layer.shadowPath
            // self.layer.masksToBounds = true
    }
}