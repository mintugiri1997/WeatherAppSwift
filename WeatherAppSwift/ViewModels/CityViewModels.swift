//
//  CityViewModels.swift
//  WeatherAppSwift
//
//  Created by Mintu Giri on 13/07/21.
//

import Foundation
import CoreLocation

final class CityViewModel: ObservableObject{
    @Published var weather = WeatherResponseModel.empty()
    
    @Published var city: String = "San Francisco" {
        didSet{
            // call get location here
        }
    }
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
    
    private lazy var dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter
    }()
    
    private lazy var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh a"
        return formatter
    }()
    
    init() {
        // getLocation
    }
    
    var date: String {
        return dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.current.date)))
    }
    
    var weatherIcon: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].icon
        }
        return "sun.max.fill"
    }
    
    var temperature: String {
        return getTempFor(temp: weather.current.temprature)
    }
    
    var conditions: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].main
        }
        return ""
    }
    
    var windSpeed: String {
        return String(format: "%0.1f", weather.current.wind_speed)
    }
    
    var humidity: String {
        return String(format: "%d%%", weather.current.humidity)
    }
    
    var rainChances: String {
        return String(format: "%0.0f", weather.current.dew_point)
    }
    
    func getTimeFor(timeStamp: Int) -> String{
        return timeFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timeStamp)))
    }
    
    func getTempFor(temp:Double) -> String{
        return String(format: "%0.1f", temp)
    }
    
    func getDayFor(timeStamp:Int) -> String {
        return dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timeStamp)))
    }
    
    private func getLocation(){
        CLGeocoder().geocodeAddressString(city) { placemarks, error in
            if let places = placemarks, let place = places.first {
                self.getWeather(cord: place.location?.coordinate)
            }
        }
    }
    
    private func getWeather(cord: CLLocationCoordinate2D?) {
        if let cord = cord {
            let urlString = Api.getUrlFor(lat: cord.latitude, lon: cord.longitude)
            getWeatherInternal(city: city, for: urlString)
        } else {
            let urlString = Api.getUrlFor(lat: 37.5485, lon: -121.9886)
            getWeatherInternal(city: city, for: urlString)
        }
    }
    
    private func getWeatherInternal(city:String,for urlString: String){
        NetworkManager<WeatherResponseModel>.fetch(for: URL(string: urlString)!) { (result) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.weather = response
                }
            case .failure(let err):
                print(err)
            }
        }
    }
}
