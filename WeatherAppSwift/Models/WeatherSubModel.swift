//
//  WeatherSubModel.swift
//  WeatherAppSwift
//
//  Created by Mintu Giri on 12/07/21.
//

import Foundation

struct WeatherSubModel: Codable, Identifiable {
    var date: Int
    var temprature: Double
    var feels_like: Double
    var pressure: Int
    var humidity: Int
    var dew_point: Double
    var clouds: Int
    var wind_speed: Double
    var wind_deg: Int
    var weather: [WeatherDetailSubModel]
    
    enum CodingKey: String {
        case date
        case temprature
        case feels_like
        case pressure
        case humidity
        case dew_point
        case clouds
        case wind_speed
        case wind_deg
        case weather
    }
    
    init() {
        date = 0
        temprature = 0.0
        feels_like = 0.0
        pressure = 0
        humidity = 0
        dew_point = 0.0
        clouds = 0
        wind_speed = 0.0
        wind_deg = 0
        weather = []
    }
    
}

extension WeatherSubModel {
    var id: UUID{
        return UUID()
    }
}
