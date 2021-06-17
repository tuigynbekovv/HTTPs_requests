/*
 *  ParseManager.swift
 *  HTTP_requests
 *
 *  Created by tuigynbekov on 2/9/21.
 */

import Foundation
class ParseManager {

    static let shared = ParseManager()
    let networkManager: NetworkManager = Router(parser: CustomParser())
    private init() {}

    func multipartFormData<T: Decodable>(url: String, parameters: Parameters? = nil, completion: @escaping (T?, String?) -> ()) -> Void {
        let token = ""
        print("LOG: ", parameters as Any, token as Any)

        let endpoint = Endpoints.multipartFormData(url: url, parameters: parameters, token: token)
        let dispatch = DispatchQueue.global(qos: .utility)

        dispatch.async {
            self.networkManager.request(endpoint) { (result: Result<T>) in
                switch result {
                case .failure(let error):
                    DispatchQueue.main.async {
                        completion(nil, error)
                    }
                case .success(let value):
                    DispatchQueue.main.async {
                        completion(value, nil)
                    }
                }
            }
        }
    }

    func postRequest<T: Decodable>(url: String, parameters: Parameters? = nil, completion: @escaping (T?, String?) -> ()) -> Void {
        let token = ""
        print("LOG: ", parameters as Any, token as Any)

        let endpoint = Endpoints.post(url: url, parameters: parameters, token: token)
        let dispatch = DispatchQueue.global(qos: .utility)

        dispatch.async {
            self.networkManager.request(endpoint) { (result: Result<T>) in
                switch result {
                case .failure(let error):
                    DispatchQueue.main.async {
                        completion(nil, error)
                    }
                case .success(let value):
                    DispatchQueue.main.async {
                        completion(value, nil)
                    }
                }
            }
        }
    }

    func getRequest<T: Decodable>(url: String, parameters: Parameters? = nil, completion: @escaping (T?, String?) -> ()) -> Void {
        let token = ""
        print("LOG: ", parameters as Any, token as Any)

        let endpoint = Endpoints.get(url: url, parameters: parameters, token: token)
        let dispatch = DispatchQueue.global(qos: .utility)

        dispatch.async {
            self.networkManager.request(endpoint) { (result: Result<T>) in
                switch result {
                case .failure(let error):
                    DispatchQueue.main.async {
                        completion(nil, error)
                    }
                case .success(let value):
                    DispatchQueue.main.async {
                        completion(value, nil)
                    }
                }
            }
        }
    }
    
    func deleteRequest<T: Decodable>(url: String, parameters: Parameters? = nil, completion: @escaping (T?, String?) -> ()) -> Void {
        
        let token = ""
        print("LOG: ", parameters as Any, token as Any)

        let endpoint = Endpoints.deleteRequest(url: url, parameters: parameters, token: token)
        let dispatch = DispatchQueue.global(qos: .utility)

        dispatch.async {
            self.networkManager.request(endpoint) { (result: Result<T>) in
                switch result {
                case .failure(let error):
                    DispatchQueue.main.async {
                        completion(nil, error)
                    }
                case .success(let value):
                    DispatchQueue.main.async {
                        completion(value, nil)
                    }
                }
            }
        }
    }
}
