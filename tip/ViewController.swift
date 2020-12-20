//
//  ViewController.swift
//  tip
//
//  Created by Zach Dorame-Barajas on 12/13/20.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var segTitles: UISegmentedControl!
    
    // called on startup
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Check if this is the first time the app has been opened
        // if so, set tipPercentages values to their defaults
        let defaults = UserDefaults.standard
        // let firstLaunch = UserDefaults.standard.bool(forKey: "firstLaunch")
        
        // if any of the presets were modified, then the app was launched for the first time
        let firstLaunch = !(defaults.bool(forKey: "presOne") || defaults.bool(forKey: "presTwo") || defaults.bool(forKey: "presThree"))
        if firstLaunch{
            let defaults = UserDefaults.standard
            defaults.set(15, forKey: "presOne")
            defaults.set(18, forKey: "presTwo")
            defaults.set(20, forKey: "presThree")
            defaults.synchronize()
            print("tipPercentages set for the first time")
            UserDefaults.standard.set(true, forKey: "firstLaunch")
        }
        else{
            print("App was not launched for the first time")
        }
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        segTitles.setTitle((defaults.string(forKey: "presOne") ?? "0") + "%", forSegmentAt: 0)
        segTitles.setTitle((defaults.string(forKey: "presTwo") ?? "0") + "%", forSegmentAt: 1)
        segTitles.setTitle((defaults.string(forKey: "presThree") ?? "0") + "%", forSegmentAt: 2)
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        print("calculateTip called")
        let defaults = UserDefaults.standard
        // get the bill amount
        
        // if left of ?? isn't invalid, then bill = 0
        let bill = Double(billField.text!) ?? 0
        // calculate the tip and total
        // let tipPercentages = [0.15, 0.18, 0.2]
        let tipPercentages = [defaults.double(forKey: "presOne")/100, defaults.double(forKey: "presTwo")/100, defaults.double(forKey: "presThree")/100]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // update the tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

