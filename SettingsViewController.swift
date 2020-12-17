//
//  SettingsViewController.swift
//  tip
//
//  Created by Zach Dorame-Barajas on 12/15/20.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var presetOne: UITextField!
    @IBOutlet weak var presetTwo: UITextField!
    @IBOutlet weak var presetThree: UITextField!
    
    @IBAction func setFieldOne(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(presetOne.text, forKey: "presOne")
        //print("here")
        defaults.synchronize()
        print("presetOne successfully set")
    }
    
    @IBAction func setFieldTwo(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(presetTwo.text, forKey: "presTwo")
        defaults.synchronize()
        print("presetTwo successfully set")
    }
    
    @IBAction func setFieldThree(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(presetThree.text, forKey: "presThree")
        defaults.synchronize()
        print("presetThree successfully set")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
