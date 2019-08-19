//
//  PasswordsViewController.swift
//  SuperSenha
//
//  Copyright © 2019 Rafaela Galdino. All rights reserved.
//

import UIKit

class PasswordsViewController: UIViewController {

    @IBOutlet weak var tvPasswords: UITextView!
    
    var numberOfPasswords = 1
    var numberOfCharacteres = 10
    var useLetters: Bool!
    var useNumbers: Bool!
    var useCapitalLetters: Bool!
    var useSpecialCharacteres: Bool!
    
    var passwordGenerator: PasswordGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Total de senhas \(numberOfPasswords)"
        passwordGenerator = PasswordGenerator(numberOfCharacter: numberOfCharacteres, useLetters: useLetters, useNumbers: useNumbers, useCapitalLetters: useCapitalLetters, useSpecialCharacters: useSpecialCharacteres)
        
        generatePassword()
    }
    
    func generatePassword() {
        tvPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0)) // leva o meu scroll para uma posição específica
        tvPasswords.text = ""
        let passwords = passwordGenerator.generate(total: numberOfPasswords)
        for password in passwords {
            tvPasswords.text.append(password + "\n\n")
        }
    }
    
    @IBAction func generate(_ sender: UIButton) {
        generatePassword()
    }
}
