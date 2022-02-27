//
//  ViewController.swift
//  Calculator-CollectionView
//
//  Created by ineta.magone on 25/02/2022.
//

import UIKit

class ViewController: UIViewController {
    
    let calculatorLogic = CalculatorLogic()
    
    @IBOutlet weak var screenText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tappedNumber(_ sender: UIButton) {
        guard let labelText: String = sender.titleLabel?.text else {return}
        calculatorLogic.numberTapped(screenText: screenText, number: labelText)
    }
    
    @IBAction func tappedAction(_ sender: UIButton) {
        guard let labelText: String = sender.titleLabel?.text else {return}
        calculatorLogic.operandTapped(screenText: screenText, operand: labelText)
    }
    
    @IBAction func tappedEqual(_ sender: UIButton) {
        calculatorLogic.equalTapped(screenText: screenText)
    }
    
    @IBAction func tappedClear(_ sender: UIButton) {
        calculatorLogic.clearTapped(screenText: screenText)
    }
    
}

