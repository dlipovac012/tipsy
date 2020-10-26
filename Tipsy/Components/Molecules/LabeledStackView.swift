//
//  LabeledStackView.swift
//  Tipsy
//
//  Created by Dalibor Lipovac on 19/10/2020.
//

import UIKit

class LabeledStackView: UIStackView {
    
    var upperLabel: Label!
    var bottomView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init<V>(title: String, bottomView: V?) where V: UIView {
        self.init(frame: .zero)
        
        self.upperLabel = Label(title: title)
        
        if bottomView != nil {
            self.bottomView = bottomView
        }
        
        layoutUI()
    }
    
    private func layoutUI() {
        self.axis = .vertical
        self.distribution = .equalSpacing
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addArrangedSubview(upperLabel)
        if self.bottomView == nil { return }
        
        // center subview horizontally and vertically
        bottomView.center = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        
        self.addArrangedSubview(bottomView!)
    }
}
