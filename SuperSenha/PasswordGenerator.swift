//
//  PasswordGenerator.swift
//  SuperSenha
//
//  Copyright © 2019 Rafaela Galdino. All rights reserved.
//

import Foundation

class PasswordGenerator {
    var numberOfCharacter: Int
    var useLetters: Bool
    var useNumbers: Bool
    var useCapitalLetters: Bool
    var useSpecialCharacters: Bool
    
    var passwords: [String] = []
    
    private var letters = "abcdefghijklmnopqrstuvwxyz"
    private var specialCharacters = "!@#$%^&*()_-==,<>./?|\':{}[]"
    private var numbers = "1234567890"

    init(numberOfCharacter: Int, useLetters: Bool, useNumbers: Bool, useCapitalLetters: Bool, useSpecialCharacters: Bool) {
        var numChars = min(numberOfCharacter, 16)
        numChars = max(numChars, 1)
        
        self.numberOfCharacter = numChars
        self.useLetters = useLetters
        self.useNumbers = useNumbers
        self.useCapitalLetters = useCapitalLetters
        self.useSpecialCharacters = useSpecialCharacters
    }
    
    func generate(total:Int) -> [String] {
        passwords.removeAll() // remove todo o conteudo do array
        var universe: String = ""
        
        if useLetters {
            universe += letters
        }
        
        if useNumbers {
            universe += numbers
        }
        
        if useCapitalLetters {
            universe += letters.uppercased()
        }
        
        if useSpecialCharacters {
            universe += specialCharacters
        }
        
        let universeArray = Array(universe) // criando um array com o meu universo de caracteres
        
        while passwords.count < total {
            var password = ""
            for _ in 1...numberOfCharacter {
                let index = Int.random(in: 0...universeArray.count-1)
                password += String(universeArray[index])
            }
            passwords.append(password)
        }
        return passwords
    }
}
