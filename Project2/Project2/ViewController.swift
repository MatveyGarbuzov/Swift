//
//  ViewController.swift
//  Project2
//
//  Created by Matvey Garbuzov on 19.05.2021.
//


import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries      = [String]()
    var score          = 0
    var correctAnswer  = 0
    var stepsCount     = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion(action: nil)
    }
    
    func askQuestion(action: UIAlertAction!) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
//        title = "\(countries[correctAnswer].uppercased())   SCORE: \(score)"
        title = "\(countries[correctAnswer].uppercased())"
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var AlertControllerTitle = "Continue"
        var finalMessage = "Your score is "
        stepsCount += 1
        
        if stepsCount == 5 {
            if sender.tag == correctAnswer {
                score += 1
            } else {
                score -= 1
            }
            if score < 0 {
                score = 0
            }
            title = "Thanks for the game!"
            finalMessage = "Your total score is \(score)"
            AlertControllerTitle = "Play again"
            score = 0
            stepsCount = 0
        } else if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            finalMessage += "\(score)"
        } else {
            title = "Wrong\nThat's the flag of "
            if countries[sender.tag] == "us" || countries[sender.tag] == "uk" {
                title += countries[sender.tag].uppercased()
            } else {
                title += countries[sender.tag].capitalized
            }
            if score != 0 {
                score -= 1
            }
            finalMessage += "\(score)"
        }
        
        let ac = UIAlertController(title: title, message: finalMessage, preferredStyle: .alert) //actionSheet
        
        ac.addAction(UIAlertAction(title: AlertControllerTitle, style: .default, handler: askQuestion))
        
        present(ac, animated: true)
    }
        
    @IBAction func buttonScoreTapped(_ sender: UIButton) {
        let ac = UIAlertController(title: "Your score is \(score)", message: nil,  preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Back", style: .default, handler: nil))
        present(ac, animated: true)
    }
    
}

