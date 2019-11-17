//
//  ViewController.swift
//  JsonDecodableMethod
//
//  Created by jabeed on 12/10/19.
//  Copyright © 2019 jabeed. All rights reserved.
//

import UIKit
struct Countrys:Decodable {
    let name:String
    let capital:String
    let region:String
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.decodable()
    }

    func decodable() {
        let url = "https://restcountries.eu/rest/v2/all"
        let urlObj = URL(string: url)
        URLSession.shared.dataTask(with: urlObj!) { (data,response,error ) in
            do {
                let countries = try JSONDecoder().decode([Countrys].self, from: data!)
                for countre  in countries {
                    print(countre.name)
                }
                
            }catch {
                print("we got error")
            }
        }.resume()
    }
}



