//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let calculator = Calculator()
    
    // MARK: - Outlets

    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculator.displayAlertDelegate = self
    }

    // MARK: - Action

    @IBAction func tappedNumberButton(_ sender: UIButton) {
        for (i, numberButton) in numberButtons.enumerated() {
            if sender == numberButton {
                textView.text = calculator.addNewNumber(i)
            }
        }
    }

    @IBAction func plus() {
        textView.text = calculator.addition()
    }

    @IBAction func minus() {
        textView.text = calculator.substraction()
    }

    @IBAction func equal() {
        textView.text = calculator.calculateTotal()
    }
    
    @IBAction func squareRoot() {
        textView.text = calculator.calculateSquareRoot()
    }

}

extension ViewController: DisplayAlert {
    func showAlert(message: String) {
        let alertVC = UIAlertController(title: "Zéro!", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
    
    
    
    
}
