//
//  ApiExtensions.swift
//  WeatherAppSwift
//
//  Created by Mintu Giri on 12/07/21.
//

import Foundation

extension Api {
    static let baseUrlString = "https://api.openweathermap.org/data/2.5/"
    
    /*
     returns full url
     */
    static func getUrlFor(lat:Double,lon:Double) -> String {
        return "\(baseUrlString)onecall?lat=\(lat)&lon=\(lon)&exclude=minutely&appid=\(Api.key)"
    }
}
