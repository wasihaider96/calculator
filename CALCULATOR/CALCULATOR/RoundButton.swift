//
//  RoundButton.swift
//  CALCULATOR
//
//  Created by Dev ILI on 26/07/2021.
//

import UIKit

@IBDesignable

class RoundButton: UIButton {

    @IBInspectable var roundbutton:Bool = false {
        didSet {
            if roundbutton {
                layer.cornerRadius = frame.height/2
            }
        }
    }
    override func prepareForInterfaceBuilder() {
        if roundbutton {
            layer.cornerRadius = frame.height/2
        }
    }
}
