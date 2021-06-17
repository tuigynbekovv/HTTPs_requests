/*
 *  Result.swift
 *  HTTP_requests
 *
 *  Created by tuigynbekov on 2/9/21.
 */

import Foundation

public enum Result<T: Decodable> {
    case failure(String)
    case success(T)
}
