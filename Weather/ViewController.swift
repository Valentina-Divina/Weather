//
//  ViewController.swift
//  Weather
//
//  Created by Valya on 27.09.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let service = Service()
    let serviceDaily = ServiceDaily()
    let timezone = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let country = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let weatherDescription = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let tempView = TempView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let humidityView = HumidityView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let windSpeedView = WindSpeedView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let pressureView = PressureView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    var dayliData: [Day] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        
        self.view.addSubview(tempView)
        self.view.addSubview(humidityView)
        self.view.addSubview(windSpeedView)
        self.view.addSubview(pressureView)
        
        timezoneConstraints()
        createCountryConstraints()
        weatherDescriptionConstraints()
        tempConstraints()
        humidityConstraints()
        windSpeedConstraints()
        pressureConstraints()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.backgroundColor = UIColor.init(red: 0, green: 0.34, blue: 0.75, alpha: 0.2)
        self.tableView.register(DailyTVC.self, forCellReuseIdentifier: "TableViewCell") // регистрация ячейки
        tableView.layer.cornerRadius = 20
        tableView.isScrollEnabled = false
        subviews()
        constraints()
        getWeather()
        getDailyWeather()
    }
    
    func assignbackground(){
        let background = UIImage(named: "background_svg")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    func initLabel(targetLabel: UILabel, text: String, font:UIFont?, center: CGPoint) {
        
        targetLabel.font = font
        targetLabel.textColor = .white
        targetLabel.center = center
        targetLabel.textAlignment = .center
        targetLabel.numberOfLines = 2
        targetLabel.text = text
        targetLabel.lineBreakMode = .byTruncatingTail
        
        self.view.addSubview(targetLabel)
    }
    
    // MARK: - timezoneConstraints
    func timezoneConstraints() {
        initLabel(targetLabel: timezone, text: "Шумерля", font: UIFont(name: "Helvetica", size: 22),center: self.view.center)
        timezone.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalToSuperview().inset(150)
        }
    }
    //MARK: - createCountryConstraints
    func createCountryConstraints() {
        initLabel(targetLabel: country, text: "Россия", font: UIFont(name: "Helvetica", size: 15), center: self.view.center)
        country.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(timezone).inset(30)
        }
    }
    // MARK: - weatherDescriptionConstraints
    func weatherDescriptionConstraints() {
        initLabel(targetLabel: weatherDescription, text: "Чистое небо", font: UIFont(name: "Helvetica", size: 23), center: self.view.center)
        weatherDescription.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(country).inset(100)
        }
    }
    
    // MARK: - tempConstraints
    
    func tempConstraints() {
        tempView.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(weatherDescription).inset(40)
        }
    }
    
    // MARK: - humidityConstraints
    
    func humidityConstraints() {
        humidityView.snp.makeConstraints { maker in
            maker.top.equalTo(tempView).inset(130)
            maker.left.equalToSuperview().inset(90)
        }
    }
    
    // MARK: - windSpeedViewConstraints
    
    func windSpeedConstraints() {
        windSpeedView.snp.makeConstraints { maker in
            maker.top.equalTo(tempView).inset(130)
            maker.centerX.equalToSuperview()
        }
    }
    // MARK: - windSpeedViewConstraints
    
    func pressureConstraints() {
        pressureView.snp.makeConstraints { maker in
            maker.top.equalTo(tempView).inset(130)
            maker.right.equalToSuperview().inset(90)
        }
    }
    
    // MARK: - get weather
    private func getWeather() {
        service.loadWeatherCity(city: "Moscow", completion: { [weak self] today in
            self?.timezone.text = today.name
            self?.country.text = today.sys.country
            self?.tempView.temp.text = String(Int(today.main.temp))
            self?.weatherDescription.text = today.weather[0].weatherDescription
            self?.humidityView.humidity.text = String(today.main.humidity) + "%"
            self?.windSpeedView.windSpeed.text = String(Int(today.wind.speed)) + " " + "м/с"
            self?.pressureView.pressure.text = String(today.main.pressure) + "%"
        })
    }
    
    private func getDailyWeather() {
        var dayToDrop = ""
        
        serviceDaily.loadWeatherCity(city: "London", completion: {[weak self] daily in
            let convertedDays: [Day] = daily.dailyList.map({ daily in
                let convertedDay = daily.dtTxt.convertToDate()
                return Day(
                    minTemp: String(daily.main.tempMin),
                    maxTemp: String(daily.main.tempMax),
                    dayName: convertedDay?.short ?? "",
                    partOfUrl: daily.weather[0].icon
                )
            })
            
            self?.dayliData = convertedDays.filter({ item in
                if item.dayName == dayToDrop {
                    return false
                } else {
                    dayToDrop = item.dayName
                    return true
                }
            })
        })
    }
}

// MARK: - extensions TableView
extension ViewController {
    func subviews() {
        view.addSubview(tableView)
    }
    
    func constraints() {
        tableView.snp.makeConstraints { maker in
            maker.top.equalTo(windSpeedView).inset(80)
            maker.left.right.equalToSuperview().inset(50)
            maker.bottom.equalToSuperview().inset(104)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case self.tableView:
            return self.dayliData.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! DailyTVC
        cell.dayName.text = self.dayliData[indexPath.row].dayName
        cell.imageUrl.load(partOfUrl: self.dayliData[indexPath.row].partOfUrl)
        cell.minTemp.text = self.dayliData[indexPath.row].minTemp
        cell.maxTemp.text = self.dayliData[indexPath.row].maxTemp
        cell.textLabel?.textColor = .white
        cell.selectionStyle = UITableViewCell.SelectionStyle.none // отключение выборя ячейки
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
}

// MARK: - struct Day
struct Day {
    let minTemp: String
    let maxTemp: String
    let dayName: String
    let partOfUrl: String
}

