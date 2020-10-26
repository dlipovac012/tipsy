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
    
    convenience init(title: String, color: UIColor = .systemGray2, size: CGFloat! = nil) {
        self.init(frame: .zero)
        self.text = title
        textColor = color
        
        if size != nil && size > 0 {
            font = UIFont.systemFont(ofSize: size!)
        }
        
    }
    
    private func configureUI() {
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontForContentSizeCategory = true
        textColor = .systemGray2
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}
