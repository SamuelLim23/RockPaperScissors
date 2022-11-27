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
    @IBOutlet weak var playerOptions: UIStackView!
    
    @IBOutlet weak var textOutlet: UILabel!
    
    var difficulty: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        difficulty = Int(defaults.float(forKey: "Difficulty"))
        // Do any additional setup after loading the view.
    }
    
    enum choice: String {
        case rock
        case paper
        case scissors
        case undefined
    }
    
    var player = choice.undefined

    @IBAction func chooseRock(_ sender: UIButton) {
        playerOptions.isHidden = true
        
        player = .rock
        playerChoice.image = UIImage(named:player.rawValue)
        
        let computer = cpuChoice(player)
        computerChoice.image = UIImage(named: computer.rawValue)
        
        switch computer{
        case .rock:
            textOutlet.text = "It's a tie!"
            
        case .paper:
            textOutlet.text = "You lose!"
            
        case .scissors:
            textOutlet.text = "You win!"
            
        case .undefined:
            textOutlet.text = "How the fuck did you manage to do that?" // TODO: Change to school appropriate language
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [self] in
            playerOptions.isHidden = false
            textOutlet.text = "PICK AN OPTION"
        }


    }
    
    @IBAction func choosePaper(_ sender: UIButton) {
        playerOptions.isHidden = true
        player = .paper
        playerChoice.image = UIImage(named:player.rawValue)
        
        let computer = cpuChoice(player)
        computerChoice.image = UIImage(named: computer.rawValue)
        
        switch computer{
        case .rock:
            textOutlet.text = "You win!"
            
        case .paper:
            textOutlet.text = "It's a tie!"
            
        case .scissors:
            textOutlet.text = "You lose!"
            
        case .undefined:
            textOutlet.text = "How the fuck did you manage to do that?" // TODO: Change to school appropriate language
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [self] in
            playerOptions.isHidden = false
            textOutlet.text = "PICK AN OPTION"
        }
    }
    
    @IBAction func chooseScissors(_ sender: UIButton) {
        playerOptions.isHidden = true
        
        player = .scissors
        playerChoice.image = UIImage(named:player.rawValue)
        
        let computer = cpuChoice(player)
        computerChoice.image = UIImage(named: computer.rawValue)
        
        switch computer{
        case .rock:
            textOutlet.text = "You lose!"
            
        case .paper:
            textOutlet.text = "You win!"
            
        case .scissors:
            textOutlet.text = "It's a tie!"
            
        case .undefined:
            textOutlet.text = "How the fuck did you manage to do that?" // TODO: Change to school appropriate language
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [self] in
            playerOptions.isHidden = false
            textOutlet.text = "PICK AN OPTION"
        }
        
    }
    
    func cpuChoice(_ playerChoice: choice) -> choice{
        var options = [choice.rock,choice.paper,choice.scissors]
        var winningOption: choice
        var losingOption: choice
        
        switch playerChoice{
        case .rock:
            winningOption = .paper
            losingOption = .scissors
        case .paper:
            winningOption = .scissors
            losingOption = .rock
        case .scissors:
            winningOption = .rock
            losingOption  = .paper
        case .undefined:
            winningOption = .undefined
            losingOption = .undefined
        }
        
        if(difficulty > 0){
            for _ in 0...difficulty {
                options.append(winningOption)
            }
        } else if(difficulty < 0){
            for _ in difficulty...0{
                options.append(losingOption)
            }
        }
        
        return options.randomElement()!
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
