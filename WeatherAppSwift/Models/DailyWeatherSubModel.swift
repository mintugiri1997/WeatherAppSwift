//
//  DailyWeatherSubModel.swift
//  WeatherAppSwift
//
//  Created by Mintu Giri on 12/07/21.
//

import Foundation

struct DailyWeatherSubModel: Codable, Identifiable {
    var date: Int
    var temperature: Temperature
    var weather: [WeatherDetailSubModel]
    
    enum CodingKey: String {
        case date
        case temperature
        case weather
    }
    
    init() {
        date = 0
        temperature = Temperature(min: 0, max: 0)
        weather = [WeatherDetailSubModel(main: "", description: "", icon: "")]
    }
}

extension DailyWeatherSubModel{
    var id : UUID {
        return UUID()
    }
}
