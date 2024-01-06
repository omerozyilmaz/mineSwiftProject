//
//  FinalScreenViewController.swift
//  Guess The Number
//
//  Created by Ömer Özyılmaz on 6.01.2024.
//

import UIKit

class FinalScreenViewController: UIViewController {

    
    @IBOutlet weak var labelFinal: UILabel!
    
    var final:Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(final)
        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
        
        
        if let finalValue = final {
            if finalValue {
                labelFinal.text = "Winner"
            } else {
                labelFinal.text = "Loser"
            }
        }

        
    }
    

}
