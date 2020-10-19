//
//  TextField.swift
//  Tipsy
//
//  Created by Dalibor Lipovac on 19/10/2020.
//

import UIKit

class TextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        textColor = .primaryColor
        tintColor = .primaryColor
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        attributedPlaceholder = NSAttributedString(string: "e.g. 123,45", attributes: [NSAttributedString.Key.foregroundColor: UIColor.dimmedText])
        
        autocorrectionType = .no
        keyboardType = .numberPad
        returnKeyType = .go
        clearButtonMode = .whileEditing
    }
}
