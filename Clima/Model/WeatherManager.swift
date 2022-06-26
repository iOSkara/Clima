//
//  WeatherManager.swift
//  Clima
//
//  Created by Mac on 26.06.2022.
//

import Foundation
import UIKit

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?units=metric&lang=ua&APPID=676ec05d14d710999e7ce06d56afc258"
    
    func fetchWeather(cityName: String) {
        
        let encodedCity = cityName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let urlString = "\(weatherURL)&q=\(encodedCity ?? cityName)"
        print(urlString)
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url, completionHandler: handle)
            
            task.resume()
            
        }
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) -> Void {
        
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
        
    }
}
