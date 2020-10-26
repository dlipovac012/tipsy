//
//  IncrementDecrementButton.swift
//  Tipsy
//
//  Created by Dalibor Lipovac on 25/10/2020.
//

import UIKit

class IncrementDecrementButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(title: String!) {
        self.init(frame: .zero)
        
        setTitle(title, for: .normal)
        
        layoutUI()
    }
    
    private func layoutUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = .grayishGreen
        setTitleColor(.systemGray2, for: .normal)
    }
}
