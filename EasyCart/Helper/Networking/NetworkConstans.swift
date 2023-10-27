//
//  NetworkConstans.swift
//  Easycart
//
//  Created by Ly Chenghav on 3/10/23.
//

import Foundation


//typealias Completion                = ()                -> Void
typealias Completion_Int            = (Int)             -> Void
typealias Completion_Bool           = (Bool)            -> Void
typealias Completion_NSError        = (NSError?)        -> Void
typealias Completion_String         = (String)          -> Void
typealias Completion_String_String  = (String, String)  -> Void
typealias Completion_String_Error   = (String, Error?)  -> Void

enum HTTPMethod : String {
    case GET    = "GET"
    case POST   = "POST"
    case PUT    = "PUT"
    case PATCH  = "PATCH"
    case DELETE = "DELETE"
}

enum XAppVersion : String {
   case base = "20210705"

}
enum UserDefaultKey : String {
    case appLang = "appLang"
}

enum NotifyKey : String {
    case reloadLocalize = "reloadLocalize"
    
}
enum APIKey: String {
    
    static var baseURL = "https://wecafe-api.kosign.dev/"
    
    #if DEBUG
    case mg                         = "api/v2/app/setting/9178a6ee-e434-4969-afcf-f161788348c4?os="
    #else
    case mg                         = "api/v2/app/setting/9178a6ee-e434-4969-afcf-f161788348c4?os="
    #endif
    

    
    case GetPurchaseOrder           = "api/mc/v1/purchase-orders"
    //"/api/mc/v1/purchase-orders?start_date=2022-09-10&end_date=2022-09-10&page_number=1&page_size=5&sort_by=asc"
    case GetSaleReport              = "api/mc/v1/reports/sales"
    
    case GetSummaryReport =
            "api/mc/v1/reports/summary"
    
    case GetStockAndFreezer         = "api/mc/v1/stocks"
    
    case GetOrderSale               =  "api/mc/v1/orders?search_value =&start_date=2021-09-10&end_date=2023-09-10&page_number=1&page_size=5&sort_by=asc"
    
    case TopBalance                 = "api/mc/v1/users/"
    
    case GetToken                   = "api/mc/v1/auth/token"
    
    case GetStockTransfer = "api/mc/v1/transfer-stocks"
 
    case GetTeaTimeOrder            = "api/mc/v1/orders/teatimes"//"/api/mc/v1/orders/teatimes"
        
    case GetMasterGroup             = "api/mc/v1/orders/master-groups"
    
    case GetUser                    = "api/mc/v1/users"
    
    case GetMyProfile = "api/mc/v1/profile?device_token&model_name&os_version"
    case GetOrderHistory = "api/mc/v1/orders"
    
}

