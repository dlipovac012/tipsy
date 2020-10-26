//
//  ViewController.swift
//  Tipsy
//
//  Created by Dalibor Lipovac on 18/10/2020.
//

import UIKit


protocol CalculateDelegate {
    func calculateButtonTapped(amount: Float, tip: Int, participants: UInt)
}

class BaseViewController: UIViewController {
    
    let upperView = UpperSectionView()
    let lowerView = LowerSectionView()
    let calculateButton = GenericButton(title: "Calculate")
    
    var calculateDelegate: CalculateDelegate!
    
    var billStackView: LabeledStackView!
    var billTextField: TextField!
    var tipSelectorStackView: TipSelectorView!
    var tipSelectorView: LabeledStackView!
    var counterStackView: CounterView!
    var counterView: LabeledStackView!
    
    var resultViewController: ResultViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        resultViewController = ResultViewController()
        // set delegate
        calculateDelegate = resultViewController
                
        // upper part
        billTextField = TextField()
        billStackView = LabeledStackView(title: "Enter bill total", bottomView: billTextField)
        
        // middle part
        tipSelectorStackView = TipSelectorView(for: [10, 20, 30])
        tipSelectorView = LabeledStackView(title: "Select tip", bottomView: tipSelectorStackView)
        
        // lower part
        counterStackView = CounterView();
        counterView = LabeledStackView(title: "Choose split", bottomView: counterStackView)

        layoutUI()
        layoutBillStackView()
        layoutTipPercentageStackView()
        layoutCounterStackView()
        layoutCalculateButton()
    }
    
    @objc private func calculate() {
        guard let delegate = calculateDelegate else { return }
        
        let amount: Float = (billTextField.text! as NSString).floatValue
        let tip: Int = tipSelectorStackView.activePercentageValue
        let participants: UInt = counterStackView.counter
    
        delegate.calculateButtonTapped(amount: amount, tip: tip, participants: participants)
        
        present(resultViewController, animated: true, completion: nil)
    }
    
    /**
     Layout UI in the controller
     */
    private func layoutUI() {
        view.addSubview(upperView)
        view.addSubview(lowerView)
        
        configureUpperView(for: 0.25)
        configureLowerView()
    }
    
    private func layoutTextField() {
        NSLayoutConstraint.activate([
            billTextField.bottomAnchor.constraint(equalTo: billStackView.bottomAnchor),
            billTextField.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
    
    private func layoutBillStackView() {
        upperView.addSubview(billStackView)
        layoutTextField()
        
        NSLayoutConstraint.activate([
            billStackView.bottomAnchor.constraint(equalTo: upperView.bottomAnchor, constant: -40),
            billStackView.leadingAnchor.constraint(equalTo: upperView.leadingAnchor, constant: 30),
            billStackView.trailingAnchor.constraint(equalTo: upperView.trailingAnchor, constant: -30),
            billStackView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func layoutTipPercentageStackView() {
        lowerView.addSubview(tipSelectorView)
        
        NSLayoutConstraint.activate([
            tipSelectorView.topAnchor.constraint(equalTo: lowerView.topAnchor, constant: 30),
            tipSelectorView.leadingAnchor.constraint(equalTo: lowerView.leadingAnchor, constant: 30),
            tipSelectorView.trailingAnchor.constraint(equalTo: lowerView.trailingAnchor, constant: -30),
            tipSelectorView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func layoutCounterStackView() {
        lowerView.addSubview(counterView)
        
        NSLayoutConstraint.activate([
            counterView.topAnchor.constraint(equalTo: tipSelectorView.bottomAnchor, constant: 30),
            counterView.leadingAnchor.constraint(equalTo: lowerView.leadingAnchor, constant: 30),
            counterView.trailingAnchor.constraint(equalTo: lowerView.trailingAnchor, constant: -30),
            counterView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func layoutCalculateButton() {
        lowerView.addSubview(calculateButton)
        
        calculateButton.addTarget(self, action: #selector(calculate), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            calculateButton.bottomAnchor.constraint(equalTo: lowerView.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            calculateButton.leadingAnchor.constraint(equalTo: lowerView.leadingAnchor, constant: 40),
            calculateButton.trailingAnchor.constraint(equalTo: lowerView.trailingAnchor, constant: -40),
            calculateButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    /**
     Layout and configure upper part of the view controller
     */
    private func configureUpperView(for percentage: CGFloat!) {
        upperView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            upperView.topAnchor.constraint(equalTo: view.topAnchor),
            upperView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            upperView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            upperView.heightAnchor.constraint(equalToConstant: view.frame.height * percentage),
        ])
    }
    
    /**
     Layout and configure lower part of the view controller
     */
    private func configureLowerView() {
        lowerView.backgroundColor = .secondaryColor
        
        NSLayoutConstraint.activate([
            lowerView.topAnchor.constraint(equalTo: upperView.bottomAnchor),
            lowerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            lowerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            lowerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
