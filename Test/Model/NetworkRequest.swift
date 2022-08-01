//
//  NetworkRequest.swift
//  Test
//
//  Created by Игорь Ущин on 01.08.2022.
//

import Foundation

class NetworkRequest {
    
    func jsonRequest(completion: @escaping (Swift.Result<ResultModel, Error>) -> Void) {
        let urlString = "https://raw.githubusercontent.com/avito-tech/internship/main/result.json"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                }
                guard let data = data else { return }
                do {
                    let json = try JSONDecoder().decode(ResultModel.self, from: data)
                    completion(.success(json))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
