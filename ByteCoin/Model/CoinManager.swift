//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "?apikey=D0A500C5-5B2B-44B9-A482-3860549E1452"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String) {
        
        if let urlString = "\(baseURL)+\(currency)+\(apiKey)" as String? {
            let url = URL(string: urlString)!
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {(data, response, error) in
                if error != nil {
                    print(error)
                    return
                }
                
                if let safeData = data {
                    if let exchange = self.parseJSON(safeData) {
                        print(exchange)
                    }
                }
            
            
        }
        
    }
