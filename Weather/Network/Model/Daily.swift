

import UIKit

class Daily: Decodable {
    let dailyList: [DailyList]
    
    enum CodingKeys: String, CodingKey {
        case dailyList = "list"
    }
    
    init(dailyList: [DailyList]) {
        self.dailyList = dailyList
    }
}

// MARK: - List
class DailyList: Decodable {

    let main: MainClass
    let weather: [Weather]
    let dtTxt: String
 
    enum CodingKeys: String, CodingKey {
        case  main, weather
        case dtTxt = "dt_txt"
    }
    
    init(main: MainClass, weather: [Weather], dtTxt: String) {
        self.main = main
        self.weather = weather
        self.dtTxt = dtTxt
    }
}

// MARK: - MainClass
class MainClass: Decodable {
    let tempMin, tempMax: Double
    
    enum CodingKeys: String, CodingKey {
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
    
    init(tempMin: Double, tempMax: Double) {
        self.tempMin = tempMin
        self.tempMax = tempMax
    }
}

// MARK: - Weather
class Weather: Decodable {
    let icon: String
    
    enum CodingKeys: String, CodingKey {
        case icon
    }
    
    init(icon: String) {
        self.icon = icon
    }
}


