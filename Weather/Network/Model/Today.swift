import UIKit

class Today: Decodable {
    let name: String
    let wind: WindToday
    let weather: [WeatherToday]
    let sys: SysToday
    let main: MainToday
    
    
    init(weather: [WeatherToday], main: MainToday, wind: WindToday, sys: SysToday, timezone: Int, name: String) {
        self.weather = weather
        self.main = main
        self.wind = wind
        self.sys = sys
        self.name = name
    }
}

// MARK: - Main
class MainToday: Decodable {
    let temp: Double
    let pressure, humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temp
        case pressure, humidity
    }
    
    init(temp: Double, pressure: Int, humidity: Int) {
        self.temp = temp
        self.pressure = pressure
        self.humidity = humidity
    }
}

// MARK: - Sys
class SysToday: Decodable {
    let country: String
    
    init(type: Int, id: Int, country: String, sunrise: Int, sunset: Int) {
        self.country = country
    }
}

// MARK: - Weather
class WeatherToday: Decodable {
    let weatherDescription: String
    
    enum CodingKeys: String, CodingKey {
        case weatherDescription = "description"
    }
    
    init(weatherDescription: String) {
        self.weatherDescription = weatherDescription
    }
}

// MARK: - Wind
class WindToday: Decodable {
    let speed: Double
    
    init(speed: Double) {
        self.speed = speed
    }
}
