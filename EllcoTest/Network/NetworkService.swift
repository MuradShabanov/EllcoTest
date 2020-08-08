//
//  NetworkService.swift
//  EllcoTest
//
//  Created by Мурад on 06.08.2020.
//  Copyright © 2020 Murad. All rights reserved.
//

import Foundation

class NetworkService {
    
    private var dataTak: URLSessionDataTask?
    
    func getData(completion: @escaping (Result<Tickets, Error>) -> Void) {
        
        let dataTask: URLSessionDataTask?
        let url = URL(string: "https://lk.ellco.ru:8000/bug_tracker/")
        guard let requestUrl = url else { fatalError() }
        var request = URLRequest(url: requestUrl)
        
        request.httpMethod = "GET"
        request.setValue("38fa0880d113c79d8e0196481d4f4562576b5348de1ab9619696d3449de5", forHTTPHeaderField: "X-AUTH-TOKEN")
        request.addValue("application/json", forHTTPHeaderField:"Content-Type")
        request.addValue("application/json", forHTTPHeaderField:"Application")
        
        dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                completion(.failure(error))
            }
            
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
            
            guard let data = data else {
                print("Empty data")
                return
            }
            
            do {
                
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Tickets.self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            } catch let error {
                completion(.failure(error))
            }
        }
        dataTask?.resume()
    }
}


