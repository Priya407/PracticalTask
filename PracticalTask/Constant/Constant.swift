//
//  Constant.swift
//  PracticalTask
//
//  Created by Vinit Agrawal on 15/04/25.
//

import Foundation

class Constant{
    enum staticText: String{
        case requestTimeOut = "Request Timeout"
        case requestCancel = "Request is cancelled"
        case noInternetConnection = "No internet connection"
        case mappingFailed = "Mapping failed"
        case invalidURL = "Invalid URL"
        case somethingWentWrong = "Something went wrong"
        case invalidJSON = "Invalid JSON"
        case noResponseData = "No response data"
    }
    
    enum API: String{
        case categoryAPI = "http://app-interview.easyglue.in/category_repository.json"
        case homeTopApi = "http://app-interview.easyglue.in/top_repository.json"
        case homeMiddleApi = "http://app-interview.easyglue.in/middle_repository.json"
        case homemBottomApi = "http://app-interview.easyglue.in/bottom_repository.json"
    }
}
