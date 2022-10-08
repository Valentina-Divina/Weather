//
//  Extension.swift
//  Weather
//
//  Created by Valya on 08.10.2022.
//

import Foundation
import UIKit

// MARK: - extension String
extension String {
    func convertToDate() -> DayOfWeek? {

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from:self)!

        return date.dayOfTheWeek()
    }
}

// MARK: - extension Date
extension Date {
    func dayOfTheWeek() -> DayOfWeek? {
        let weekdays = [
            DayOfWeek(short: "Вс", long: "Воскресенье"),
            DayOfWeek(short: "Пн", long: "Понедельник"),
            DayOfWeek(short: "Вт", long: "Вторник"),
            DayOfWeek(short: "Ср", long: "Среда"),
            DayOfWeek(short: "Чт", long: "Четверг"),
            DayOfWeek(short: "Пт", long: "Пятница"),
            DayOfWeek(short: "Сб", long: "Суббота")
        ]

        let calendar: Calendar = Calendar.current
        let components: DateComponents = calendar.dateComponents([.weekday], from: self)
        return weekdays[components.weekday! - 1]
    }
}

struct DayOfWeek {
    let short: String
    let long: String
}

// MARK: - extension UIImageView

let iconUrl = "https://openweathermap.org/img/wn/"

extension UIImageView {
    func load(partOfUrl: String) {
        guard let constructedUrl: URL = URL.init(string: iconUrl + partOfUrl + ".png") else {
            return
        }

        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: constructedUrl) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}


