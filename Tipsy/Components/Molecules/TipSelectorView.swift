//
//  TipSelectorView.swift
//  Tipsy
//
//  Created by Dalibor Lipovac on 20/10/2020.
//

import UIKit

class TipSelectorView: UIStackView {
    
    var percentageValues: [Int]!
    var activePercentageValue: Int!
    var buttons: [PercentageButtonView] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layoutUI()
    }
    
    convenience init(for values: [Int]) {
        self.init(frame: .zero)
        self.percentageValues = values
        
        configureStackView()
        
        self.activePercentageValue = values[0]
        self.buttons[0].setActive()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureStackView() {
        self.axis = .horizontal
        self.distribution = .equalSpacing
        
        for value in self.percentageValues {
            let button = PercentageButtonView(value: value, color: .primaryColor, width: 120)
            button.addTarget(self, action: #selector(percentageOptionClicked), for: .touchUpInside)
            
            self.buttons.append(button)
            self.addArrangedSubview(button)
        }
    }
    
    private func layoutUI() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc private func percentageOptionClicked(_ sender: PercentageButtonView!) {
        for b in buttons {
            b.setInactive()
        }
        
        sender.changeState()
        self.activePercentageValue = sender.value
    }
}
