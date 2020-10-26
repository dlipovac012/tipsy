//
//  PercentageButtonView.swift
//  Tipsy
//
//  Created by Dalibor Lipovac on 22/10/2020.
//

import UIKit

class PercentageButtonView: UIButton {
    
    var value: Int!
    var width: CGFloat!
    var active: Bool = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(value: Int, color: UIColor, width: CGFloat) {
        self.init(frame: .zero)
        self.value = value
        self.setTitle("\(value)%", for: .normal)
        self.backgroundColor = .secondaryColor
        self.setTitleColor(.primaryColor, for: .normal)
        self.width = width
        
        
        configurProps()
    }
    
    func changeState() {
        self.active = !self.active
        if active {
            self.backgroundColor = .primaryColor
            self.setTitleColor(.white, for: .normal)
        }
        else {
            self.backgroundColor = .secondaryColor
            self.setTitleColor(.primaryColor, for: .normal)
        }
    }
    
    func setInactive() {
        self.active = false
        self.backgroundColor = .secondaryColor
        self.setTitleColor(.primaryColor, for: .normal)
    }
    
    func setActive() {
        self.active = true
        self.backgroundColor = .primaryColor
        self.setTitleColor(.white, for: .normal)
    }
    
    private func configurProps() {
        layer.cornerRadius = 5
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layoutUI() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 44),
            self.widthAnchor.constraint(equalToConstant: 75)
        ])
    }
}
