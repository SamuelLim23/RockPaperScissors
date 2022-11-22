//
//  GameViewController.swift
//  RockPaperScissors
//
//  Created by SAMUEL LIM on 11/22/22.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var computerChoice: UIImageView!
    @IBOutlet weak var playerChoice: UIImageView!
    
    @IBOutlet weak var textOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    enum choices {
        case rock
        case paper
        case scissors
        case undefined
    }
    
    var player = choices.undefined

    @IBAction func chooseRock(_ sender: Any) {
        playerChoice.image = UIImage(named:"rock")
        player = .rock
    }
    
    @IBAction func choosePaper(_ sender: Any) {
        playerChoice.image = UIImage(named:"paper")
        player = .paper
    }
    
    @IBAction func chooseScissors(_ sender: Any) {
        playerChoice.image = UIImage(named:"scissors")
        player = .scissors
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
