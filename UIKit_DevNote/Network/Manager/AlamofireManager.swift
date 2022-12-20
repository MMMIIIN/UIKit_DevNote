//
//  AlamofireManager.swift
//  UIKit_DevNote
//
//  Created by Mingwan Choi on 2022/11/13.
//

import Foundation

import Alamofire

struct AlamofireManager {
    func fecthTestData() async throws {
        let address = "http://3.34.57.155:3000/api/v1/teams/1/reflections/current"
        AF.request(address,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: ["Content-Type":"application/json", "Accept":"application/json", "user_id": "1"]
        ).responseDecodable(of: BaseModel<Reflection>.self) { json in
            dump(json.value)
        }
        
    }
}

struct BaseModel<T: Decodable>: Decodable {
    let success: Bool
    let message: String
    let detail: T?
    
    init(success: Bool, message: String, detail: T?) {
        self.success = success
        self.message = message
        self.detail = detail
    }
}

struct TestModel: Decodable {
    let success: Bool
    let message: String
    let detail: Reflection?
}

struct Reflection: Decodable {
    let current_reflection_id: Int?
    let reflection_name: String?
    let reflection_date: String?
    let reflection_status: String?
    let reflection_keywords: [String]?
}
