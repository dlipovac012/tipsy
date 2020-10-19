//
//  ViewController.swift
//  Tipsy
//
//  Created by Dalibor Lipovac on 18/10/2020.
//

import UIKit

class BaseViewController: UIViewController {
    
    let upperView = UpperSectionView()
    let lowerView = LowerSectionView()
    var billStackView: LabeledStackView!
    var billTextField: TextField!

    override func viewDidLoad() {
        super.viewDidLoad()
                
        billTextField = TextField()
        billStackView = LabeledStackView(title: "Enter bill total", bottomView: billTextField)

        layoutUI()
        layoutBillStackView()
        layoutTextField()
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
        
        NSLayoutConstraint.activate([
            billStackView.bottomAnchor.constraint(equalTo: upperView.bottomAnchor, constant: -40),
            billStackView.leadingAnchor.constraint(equalTo: upperView.leadingAnchor, constant: 30),
            billStackView.trailingAnchor.constraint(equalTo: upperView.trailingAnchor, constant: -30),
            billStackView.heightAnchor.constraint(equalToConstant: 60)
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

