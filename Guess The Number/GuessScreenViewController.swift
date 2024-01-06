//
//  GuessScreenViewController.swift
//  Guess The Number
//
//  Created by Ömer Özyılmaz on 6.01.2024.
//

import UIKit

class GuessScreenViewController: UIViewController {

    
    @IBOutlet weak var labelRemainingLives: UILabel!
    @IBOutlet weak var labelHelp: UILabel!
    @IBOutlet weak var textFieldEnter: UITextField!
    var remaningLives = 5
    var randomNumber:Int?
    @IBAction func sentGuest(_ sender: Any) {
        labelHelp.isHidden = false
        remaningLives -= 1

        
        if let data = textFieldEnter.text{    // I change stringtype to int
            
            if let guess = Int(data){
            
                if remaningLives != 0 {
                    
                    if guess == randomNumber {
                        //Thats True
                        //Change page
                        let final = true
                        performSegue(withIdentifier: "guessToFinal", sender: final)
                        
                    }
                    if guess > randomNumber! {
                        //Increase
                        labelHelp.text = "Decrease"
                        labelRemainingLives.text = "Remaining Lives In The Game : \(remaningLives)"
                    }
                    if guess < randomNumber! {
                        //Decrease
                        labelHelp.text = "Increase"
                        labelRemainingLives.text = "Remaining Lives In The Game : \(remaningLives)"

                    }
                }else{
                    //Change Page
                    let final = false
                    performSegue(withIdentifier: "guessToFinal", sender: final)
                }
                
                textFieldEnter.text = ""
                
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let comeData = sender as? Bool {
            let gidilecekVC = segue.destination as! FinalScreenViewController
            
            gidilecekVC.final = comeData
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomNumber = Int(arc4random_uniform(100))//1-100
        print("Random Number : \(randomNumber!)")
        
    }
    
}
