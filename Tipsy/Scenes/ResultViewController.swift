//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Dalibor Lipovac on 26/10/2020.
//

import UIKit


class ResultViewController: UIViewController, CalculateDelegate {
    
    var baseViewController: BaseViewController!
    
    let upperView = UpperSectionView()
    let lowerView = LowerSectionView()
    var dismissButton: GenericButton!
    var result: TipLabel!
    var resultLabel: Label!

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
        layoutDismissButton()
        configureResultViews()
    }
    
    required init() {
        super.init(nibName: nil, bundle: nil)
        
        baseViewController = BaseViewController()
        baseViewController.calculateDelegate = self
        dismissButton = GenericButton(title: "Dismiss")
        
        resultLabel = Label(title: "Total per person", size: 24)
        result = TipLabel()
        
        dismissButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
    }
    
    @objc private func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutUI() {
        view.addSubview(upperView)
        view.addSubview(lowerView)
        view.backgroundColor = .secondaryColor
        
        configureUpperView(for: 0.6)
        configureLowerView()
    }
    
    func calculateButtonTapped(amount: Float, tip: Int, participants: UInt) {
        guard amount > 0 else { return }
        let tipPerParticipant: Float = amount * (Float(tip) / 100) / Float(participants)
        
        result.text = "\(tipPerParticipant)"
    }
    
    private func layoutDismissButton() {
        lowerView.addSubview(dismissButton)
        
        NSLayoutConstraint.activate([
            dismissButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            dismissButton.leadingAnchor.constraint(equalTo: lowerView.leadingAnchor, constant: 40),
            dismissButton.trailingAnchor.constraint(equalTo: lowerView.trailingAnchor, constant: -40),
            dismissButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureResultViews() {
        upperView.addSubview(resultLabel)
        upperView.addSubview(result)
        
        
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: upperView.topAnchor, constant: 40),
            resultLabel.heightAnchor.constraint(equalToConstant: 50),
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            result.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 0),
            result.heightAnchor.constraint(equalToConstant: 60),
            result.centerXAnchor.constraint(equalTo: upperView.centerXAnchor)
        ])
        
    }
    
    /**
     Layout and configure upper part of the view controller
     */
    private func configureUpperView(for percentage: CGFloat!) {
        upperView.backgroundColor = .secondaryColor
        
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
        lowerView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            lowerView.topAnchor.constraint(equalTo: upperView.bottomAnchor),
            lowerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            lowerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            lowerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
