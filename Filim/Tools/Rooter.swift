//
//  Rooter.swift
//  Filim
//
//  Created by Akif on 25.08.2022.
//

import Foundation
import Alamofire

struct Router: URLRequestConvertible {
    
    static private let baseUrlString = "https://api.themoviedb.org/3/"
    
    var path: String!
    var parameters: Parameters?
    var method: Alamofire.HTTPMethod!
    
    init(method: Alamofire.HTTPMethod, path: String, parameters: Parameters?) {
        self.method = method
        self.parameters = parameters
        self.path = path
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: Router.baseUrlString)!
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        if self.method == Alamofire.HTTPMethod.post {
            return try Alamofire.JSONEncoding.default.encode(urlRequest, with: self.parameters!)
        } else if self.method == Alamofire.HTTPMethod.put {
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: self.parameters)
        } else {
            return urlRequest
        }
    }
}
