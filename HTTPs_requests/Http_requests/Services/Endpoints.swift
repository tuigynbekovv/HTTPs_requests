/*
 *  Endpoints.swift
 *  HTTP_requests
 *
 *  Created by tuigynbekov on 2/9/21.
 */

import Foundation
enum Endpoints: EndpointType {

    case get(url: String, parameters: Parameters?, token: String?)
    case post(url: String, parameters: Parameters?, token: String?)
    case multipartFormData(url: String, parameters: Parameters?, token: String?)
    case deleteRequest(url: String, parameters: Parameters?, token: String?)

    var baseUrl: URL {
        return URL(string: "https://postman-echo.com/")!
    }

    var path: String {
        switch self {
        case .get(let url, _, _):
            return url
        case .post(let url, _, _):
            return url
        case .multipartFormData(let url, _, _):
            return url
        case .deleteRequest(let url,_, _):
            return url
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        case .post(_, _, _):
            return .post
        case .multipartFormData(_, _, _):
            return .post
        case .deleteRequest(_, _, _):
            return .delete
        default:
            return .get
        }
    }

    var task: HTTPTask {
        switch self {
        case .get(_, let parameters, let token):
            var urlParameters: Parameters = [:]
            var headers: HTTPHeaders = [:]
            if let params = parameters {
                urlParameters = params
            }
            if let token = token {
                headers["token"] = token
            }
            return .requestParametersAndHeaders(bodyParameters: nil, urlParameters: urlParameters, additionalHeaders: headers)
        case .post(_, let parameters, let token):
            var bodyParameters: Parameters = [:]
            var headers: HTTPHeaders = [:]
            if let params = parameters {
                bodyParameters = params
            }
            if let token = token {
                headers["token"] = token
            }
            return .requestParametersAndHeaders(bodyParameters: bodyParameters, urlParameters: nil, additionalHeaders: headers)
        case let .multipartFormData(_, parameters, token):
            var bodyParameters: Parameters = [:]
            var headers: HTTPHeaders = [:]
            if let params = parameters {
                bodyParameters = params
            }
            if let token = token {
                headers["token"] = token
            }
            return .multipartFormData(bodyParameters: bodyParameters, urlParameters: nil, additionalHeader: headers)
        case let .deleteRequest(_, parameters, token):
            var bodyParameters: Parameters = [:]
            var headers: HTTPHeaders = [:]
            if let params = parameters {
                bodyParameters = params
            }
            if let token = token {
                headers["token"] = token
            }
            return .requestParametersAndHeaders(bodyParameters: bodyParameters, urlParameters: nil, additionalHeaders: headers)
        }
    }
}

