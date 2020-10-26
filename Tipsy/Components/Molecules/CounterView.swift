//
//  CounterView.swift
//  Tipsy
//
//  Created by Dalibor Lipovac on 24/10/2020.
//

import UIKit

class CounterView: UIStackView {
    
    var counter: UInt = 1
    var counterIndicatorView: Label!
    var buttonIncrement: IncrementDecrementButton!
    var buttonDecrement: IncrementDecrementButton!
    var incrementDecrementStackView: UIStackView!
    
    convenience init() {
        self.init(frame: .zero)
        
        counterIndicatorView = Label(title: "\(counter)", color: .primaryColor)
        buttonIncrement = IncrementDecrementButton(title: "+")
        buttonDecrement = IncrementDecrementButton(title: "-")
        incrementDecrementStackView = UIStackView()
        
        configureIncrementDecrementStackView()
        configureStackView()
    }
    
    @objc private func incrementValue() {
        counter += 1
        counterIndicatorView.text = "\(counter)"
    }
    
    @objc private func decrementValue() {
        guard counter > 1 else { return }
        
        counter -= 1
        counterIndicatorView.text = "\(counter)"
    }
    
    private func configureStackView() {
        self.distribution = .fillEqually
        self.axis = .horizontal
        
        counterIndicatorView.textAlignment = .center
        counterIndicatorView.font = UIFont.systemFont(ofSize: 28, weight: .regular)
        self.addArrangedSubview(counterIndicatorView)
        self.addArrangedSubview(incrementDecrementStackView)
    }
    
    private func configureIncrementDecrementStackView() {
        incrementDecrementStackView.distribution = .fillEqually
        incrementDecrementStackView.axis = .horizontal
        incrementDecrementStackView.spacing = 2
        
        incrementDecrementStackView.addArrangedSubview(buttonIncrement)
        incrementDecrementStackView.addArrangedSubview(buttonDecrement)
        
        buttonIncrement.addTarget(self, action: #selector(incrementValue), for: .touchUpInside)
        buttonDecrement.addTarget(self, action: #selector(decrementValue), for: .touchUpInside)
    }
}
