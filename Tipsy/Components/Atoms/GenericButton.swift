//
//  GenericButton.swift
//  Tipsy
//
//  Created by Dalibor Lipovac on 25/10/2020.
//

import UIKit

class GenericButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String!) {
        self.init(frame: .zero)
        
        setTitle(title, for: .normal)
    }
    
    private func configureButton() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .primaryColor
        layer.cornerRadius = 5
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
    }
}
