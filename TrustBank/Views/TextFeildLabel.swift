//
//  TextFeildLabel.swift
//  LiquidBank
//
//  Created by Trainee on 04/07/2026.
//

import UIKit

class TextFeildLabel : UILabel{
    
    init(label: String) {
           super.init(frame: .zero)
           setup(label: label)
       }

       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
     func setup(label :String){
        
     translatesAutoresizingMaskIntoConstraints = false
        self.text = label
        textColor = UIColor(named: "textGrey")
        font = .systemFont(ofSize: 12, weight: .bold)
        
    }
    
}
