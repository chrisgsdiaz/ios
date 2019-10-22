//
//  MainViewController.swift
//  MiApp
//
//  Created by Christopher.diaz on 8/29/19.
//  Copyright © 2019 Christopher.diaz. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var pressButton: UIButton!
    
    struct Movie: Codable {
        var name: String
        var year: Int
        
        private enum CodingKeys: CodingKey {
            case name
            case year
        }
        
        init(name: String, year: Int) {
            self.name = name
            self.year = year
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.name = try container.decode(String.self, forKey: .name)
            self.year = try container.decode(Int.self, forKey: .year)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(self.name, forKey: .name)
            try container.encode(self.year, forKey: .year)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
                      "Oviedo"      : 5_324_567,
                      "Santa Cruz"  : 1_023_932]
        
        let massiveCities = cities.filter{$0.value>500_000}
        print(massiveCities)
        
        let population = cities.map{$0.value*3}
        print("Population: \(population)")
        
        let newPopulation = cities.mapValues{"\($0/1_000_000) millones de personas"}
        print(newPopulation)
        print("\n Este es el resultado: \(newPopulation)")
        
        //Agrupando las claves de las ciudades
        
        let groupedCities = Dictionary(grouping: cities.keys) {$0.first!}
        print("\n Cities groupped: \(groupedCities)")
        
        let grouppedPopulationCities = Dictionary(grouping: cities.keys) {$0.count}
        print("\n Cities groupped population: \(grouppedPopulationCities)")
        
        let person = ["name": "Christopher", "surname": "Guarneros Díaz"]
        let name = person["name", default: "Unknown"]
        //let name = person["name"] ?? "Unknown"
        print("Name: \(String(describing: name))")
        
        let favouriteSinger = ["Coldplay", "Nero", "Paco de Lucía", "Blue", "Luis Miguel", "Nero"]
        var favouriteCounts = [String:Int]()
        
        for singer in favouriteSinger {
            favouriteCounts[singer, default: 0] += 1
        }
        
        print("Contador de favoritos: \(favouriteCounts)")
        
        let people = [("Jhon", "Lenon"), ("Juan","Gabriel"), ("Madonna", "Ciccone"), ("Christian", "Grey")]
        
        let namesDict = Dictionary(uniqueKeysWithValues: people)
        print("People: \(people)")
        
        print("namesDict: \(namesDict)")
        print("namesDict: \(namesDict["Jhon"] ?? "Persona no invitada")")
        
        let primeNumbers = [2,3,5,7,11,13,19,23,31,37,41,43]
        
        print("================================")
        let combinedNumbers = Dictionary(uniqueKeysWithValues: zip(1...,primeNumbers))
        print("CombinedNumbers \(combinedNumbers)")
        
        print("================================\n\n\n\n")
        
        print("=========================================================")
        print("===============Encoder y Decoder===================")
        print("=========================================================")
        
        
        //Convertir a json clase 24 seccion 4
        
        let titanic2 = Movie(name: "Titanic", year: 1997)
        let gladiator2 = Movie(name: "Gladiator", year: 2000)
        let lor = Movie(name: "El señor de los anillos", year: 2000)
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        if let encoded = try? encoder.encode(titanic2) {
            //guardar el encoded en algun lado
            if let json = String(data: encoded, encoding: .utf8) { //Pasarlo a formato amigable de string
                print("El json es:::::\(json)")
            }
            
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode(Movie.self, from: encoded) {
                print("El decoded es:::::\(decoded)")
            }
        }
    }
        
    @IBAction func btnPressed(_ sender: Any) {
        
        let keyPathsVC = KeyPathsViewController(nibName: "KeyPathsViewController", bundle: nil)
        //let navigationKeyPathsViewController = UINavigationController(rootViewController: keyPathsVC)
        self.navigationController?.pushViewController(keyPathsVC, animated: true)
        //present(keyPathsVC, animated: true, completion: nil)
        
        if titleImageView.isHidden == true {
            titleImageView.isHidden = false
        } else {
            titleImageView.isHidden = true
        }
    }
}
