//
//  Label.swift
//  Tipsy
//
//  Created by Dalibor Lipovac on 19/10/2020.
//

import UIKit

class Label: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String, color: UIColor = .systemGray2) {
        self.init(frame: .zero)
        self.text = title
        textColor = color
    }
    
    private func configureUI() {
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontForContentSizeCategory = true
        textColor = .systemGray2
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}
