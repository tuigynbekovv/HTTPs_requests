/*
 *  NetworkManager.swift
 *  HTTP_requests
 *
 *  Created by tuigynbekov on 2/9/21.
 */

import Foundation

protocol NetworkManager {
    func request<T: Decodable>(_ route: EndpointType, completion: @escaping (Result<T>) -> Void)
    func cancel()
}
