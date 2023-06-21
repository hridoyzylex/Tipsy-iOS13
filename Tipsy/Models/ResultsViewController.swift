//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Tasib Haider on 21/6/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var tipAmount: Float?
    var totalPeople: Int?
    var individualAmount: Float?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = String(individualAmount!)
        settingsLabel.text = "Split between \(totalPeople!) people, with \(tipAmount! * 100)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
