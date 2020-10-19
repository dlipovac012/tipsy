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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutUI()
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
    
    /**
     Layout and configure upper part of the view controller
     */
    private func configureUpperView(for percentage: CGFloat!) {
        upperView.backgroundColor = .primaryColor
        
        NSLayoutConstraint.activate([
            upperView.topAnchor.constraint(equalTo: view.topAnchor),
            upperView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            upperView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            upperView.heightAnchor.constraint(equalToConstant: view.frame.height * percentage)
        ])
    }
    
    /**
     Layout and configure lower part of the view controller
     */
    private func configureLowerView() {
        lowerView.backgroundColor = .accentColor
        
        NSLayoutConstraint.activate([
            lowerView.topAnchor.constraint(equalTo: upperView.bottomAnchor),
            lowerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            lowerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            lowerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

