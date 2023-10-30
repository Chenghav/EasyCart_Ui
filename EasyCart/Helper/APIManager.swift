//
//  APIManager.swift
//  EasyCart
//
//  Created by SalinChhun on 29/10/23.
//

import Foundation
import Alamofire

class APIManager {
    static let shareInstant = APIManager()
    func RegisterAPI(register: RegisterModel, completionHandler: @escaping (Bool) -> ()) {
        let header: HTTPHeaders = [
            .contentType("application/json"),
        ]
        AF.request(register_url, method: .post, parameters: register, encoder: JSONParameterEncoder.default, headers: header).response { response in
            switch response.result {
            case .success(let data):
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    if response.response?.statusCode == 200 {
                        completionHandler(true)
                    } else {
                        completionHandler(false)
                    }
                    print("login response \(json)")
                } catch {
                    print("error \(error.localizedDescription)")
                    completionHandler(false)
                }
            case .failure(let err):
                print(err.localizedDescription)
                completionHandler(false)
            }
        }
    }
}
