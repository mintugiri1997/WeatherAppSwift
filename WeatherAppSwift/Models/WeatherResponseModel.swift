//
//  WeatherResponseModel.swift
//  WeatherAppSwift
//
//  Created by Mintu Giri on 12/07/21.
//

import Foundation

struct WeatherResponseModel: Codable {
    var current: WeatherSubModel
    var hourly: [WeatherSubModel]
    var daily: [DailyWeatherSubModel]
    
    static func empty() -> WeatherResponseModel {
        return WeatherResponseModel(current: WeatherSubModel(), hourly: [WeatherSubModel](repeating: WeatherSubModel(), count: 23), daily: [DailyWeatherSubModel](repeating: DailyWeatherSubModel(), count: 8))
    }
}
