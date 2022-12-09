//
//  OptionsViewController.swift
//  RockPaperScissors
//
//  Created by Temporary on 11/26/22.
//

import UIKit

class OptionsViewController: UIViewController {

    @IBOutlet weak var difficultySliderOutlet: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        difficultySliderOutlet.value = defaults.float(forKey: "Difficulty")
    }
    
    @IBAction func difficultySlider(_ sender: UISlider) {
        let step: Float = 1
        let roundedValue = round(sender.value / step) * step
        sender.value = roundedValue
        let defaults = UserDefaults.standard
        defaults.set(sender.value, forKey: "Difficulty")
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
