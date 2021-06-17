/*
 *  Response.swift
 *  HTTP_requests
 *
 *  Created by tuigynbekov on 2/9/21.
 */

import Foundation

class Response<T: Decodable>: Decodable {
//    let status_code: Int
    let message: String
    let result: T?
}

class ResponseSocket<T: Decodable>: Decodable {
    let statusCode: Int
    let result: T?
}
