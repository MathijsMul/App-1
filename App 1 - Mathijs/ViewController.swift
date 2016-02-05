//
//  ViewController.swift
//  App 1 - Mathijs
//
//  Created by practicum on 05/02/16.
//  Copyright © 2016 practicum. All rights reserved.
//

import UIKit

var name : String?
var number: Int?
var properties: String?

class ViewController: UIViewController {

    let value1: [Character] = ["a", "j", "s"]
    let value2: [Character] = ["b", "k", "t"]
    let value3: [Character] = ["c", "l", "u"]
    let value4: [Character] = ["d", "m", "v"]
    let value5: [Character] = ["e", "n", "w"]
    let value6: [Character] = ["f", "o", "x"]
    let value7: [Character] = ["g", "p", "y"]
    let value8: [Character] = ["h", "q", "z"]
    let value9: [Character] = ["i", "r"]
    
    @IBOutlet weak var Top1: UILabel!
    @IBOutlet weak var Top2: UILabel!
    @IBOutlet weak var EnterName: UILabel!
    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var Outcome: UITextView!
    @IBOutlet weak var IntroField: UITextField!
    @IBOutlet weak var PropField: UITextView!
    
    @IBAction func LoadName(sender: AnyObject) {
        name = NameField.text
        name = name?.lowercaseString
        print("Loaded name")
        print("\(name!)")
        
        number = CalculateName(name!)
        print(number!)
        
        properties = Numerology(number!)
        print(properties!)
    
        Outcome.text = "Numerological value: \(number!)"
        IntroField.text = "Associated properties:"
        PropField.text = properties!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("View did load")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func CalculateCharacter(letter: Character) -> Int {
        if value1.contains(letter){
            return 1
        }
        if value2.contains(letter){
            return 2
        }
        if value3.contains(letter){
            return 3
        }
        if value4.contains(letter){
            return 4
        }
        if value5.contains(letter){
            return 5
        }
        if value6.contains(letter){
            return 6
        }
        if value7.contains(letter){
            return 7
        }
        if value8.contains(letter){
            return 8
        }
        if value9.contains(letter){
            return 9
        }
        else{
            return 0
        }
    }
    
    func CalculateName(name: String) -> Int {
        var total_number = 0
        for letter in name.characters{
            var number = CalculateCharacter(letter)
            total_number += number
        }
        while total_number > 9{
            var hundreds = total_number / 100
            var remainder = total_number - (100*hundreds)
            var tens = remainder / 10
            var units = remainder - (10*tens)
            total_number = hundreds + tens + units
        }
        return total_number
    }

    func Numerology(number: Int) -> String {
        var properties = ""
        if number == 1{
            properties = "Leading, independent, attaining, individual"
        }
        if number == 2{
            properties = "Cooperation, adaptability, mediating"
        }
        if number == 3{
            properties = "Expression, verbalization, socialization"
        }
        if number == 4{
            properties = "Order, service, growth"
        }
        if number == 5{
            properties = "Visionary, adventure, constructive"
        }
        if number == 6{
            properties = "Responsibility, protection, nurturing"
        }
        if number == 7{
            properties = "Analysis, understanding, knowledge"
        }
        if number == 8{
            properties = "Status oriented, power-seeking, flexible"
        }
        if number == 9{
            properties = "Humanitarian, creative, selflessness"
        }
        return properties
    }
    
}

