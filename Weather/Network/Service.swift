//
//  Service.swift
//  Weather
//
//  Created by Valya on 07.10.2022.
//

import UIKit
import Alamofire

class Service {
    
    let baseUrl = "https://api.openweathermap.org/"
    let apiKey = "6510fbc2a5795dbe5e008c49d129fa02"
    
    func loadWeatherCity(city: String, completion: @escaping (Today) -> ()) {
        let path = "data/2.5/weather"
        let parameters = [
            "q": city,
            "units": "metric",
            "appid": apiKey,
            "lang": "ru"
        ]
        let url = baseUrl + path
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            guard let json = response.data else { return }
            do {
                let weather = try JSONDecoder().decode(Today.self, from: json)
                completion(weather)
            } catch {
                print(error)
            }
        }
    }
}
