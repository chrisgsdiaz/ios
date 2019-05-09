//
//  ViewController.swift
//  MiApp
//
//  Created by Christopher.diaz on 4/30/19.
//  Copyright © 2019 Christopher.diaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var pressButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.titleImageView.isHidden = true
        
        //Multilineas
        let str = """
            Hola que hace
            ola k ace
        """
        print(str)
        
        let testStr = "anita lava la tina"
        
        for c in testStr.reversed() {
            print(c)
        }
        
        //Rangos unilaterales
        
        let sports = ["Ciclismo", "natacion", "beisbol", "futbol", "basquetbol"]
        let first = sports[..<3]
        print(first)
        
        let second = sports[3...]
        print(second)
        
        let menu = sports[1...3]
        print(menu)
        
        let cities = ["Madrid"      : 3_165_541,
                      "Barcelona"   : 1_608_746,
                      "Sevila"      : 3_456_125,
                      "Zaragoza"    : 4_243_566,
                      "Oviedo"      : 5_324_567]
        
        let massiveCities = cities.filter{$0.value>500_000}
        print(massiveCities)
        
        let population = cities.map{$0.value*3}
        print(population)
        
        let newPopulation = cities.mapValues{"\($0/1000) millones de personas"}
        print(newPopulation)
        
    }

    @IBAction func btnPressed(_ sender: Any) {
        
        if titleImageView.isHidden == true {
            titleImageView.isHidden = false
        } else {
            titleImageView.isHidden = true
        }
    }
    
}

