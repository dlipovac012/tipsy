//
//  TipLabel.swift
//  Tipsy
//
//  Created by Dalibor Lipovac on 26/10/2020.
//

import UIKit

class TipLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        font = UIFont.systemFont(ofSize: 32)
        adjustsFontForContentSizeCategory = true
        textColor = .primaryColor
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
        
    }
}
