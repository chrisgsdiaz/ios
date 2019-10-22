//
//  KeyPathsViewController.swift
//  MiApp
//
//  Created by Christopher.diaz on 8/29/19.
//  Copyright © 2019 Christopher.diaz. All rights reserved.
//

import UIKit


//keypaths json clase 25 seccion 4


class KeyPathsViewController: UIViewController {
    
    struct Crew {
        var name: String
        var rank: String
    }
    
    struct SpaceShip {
        var name: String
        var maxSpeed: Double
        var captain: Crew
        
        func goToMaxSpeed() {
            print("La nave \(name) va a velocidad máxima de \(maxSpeed).")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let janeway = Crew(name: "Katherine Janeway", rank: "Capitan")
        let voyager = SpaceShip(name: "Voyager", maxSpeed: 5.5, captain: janeway)

        let enterMaxSpeed = voyager.goToMaxSpeed
        
        enterMaxSpeed()
    }

    @IBAction func comeBack(_ sender: Any) {
        let containerVC = ContainerViewController(nibName: "ContainerViewController", bundle: nil)
        self.navigationController?.pushViewController(containerVC, animated: true)
    }
}
