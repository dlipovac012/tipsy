//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Dalibor Lipovac on 26/10/2020.
//

import UIKit


class ResultViewController: UIViewController, CalculateDelegate {
    
    var baseViewController: BaseViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
    }

    private func layoutUI() {
        view.backgroundColor = .systemRed
    }
    
    func calculateButtonTapped(amount: Float, tip: Int, participants: UInt) {
        print(amount)
        print(tip)
        print(participants)
    }
}
