//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
   
    var tipAmount: Float = 0.1
    var totalPeople: Int = 2
    var individualAmount: Float = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        if sender.currentTitle == "0%" {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            
            tipAmount = 0.0
            
        } else if sender.currentTitle == "10%" {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            
            tipAmount = 0.1
            
        } else {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            
            tipAmount = 0.2
        }
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        totalPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print("tipAmount = \(tipAmount)")
        print("totalPeople = \(totalPeople)")
        
        let totalBill = Float(billTextField.text ?? "0.0")
        print("billTextField = \(totalBill!)")
        
        individualAmount = ((1.0 + tipAmount) * totalBill!) / Float(totalPeople)
        
        print("individualAmount = \(individualAmount)")
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.tipAmount = tipAmount
            destinationVC.totalPeople = totalPeople
            destinationVC.individualAmount = individualAmount
        }
            
    }

}

