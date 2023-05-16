

import Foundation
import Alamofire


class NetworkManager {
    static let shared = NetworkManager()
    var session: Session!
    
    func callGetApi( strUrl:String, sucessBlock: @escaping (NSDictionary)->(), failureBlock:@escaping (String) ->()) {
        
        
        var headers:HTTPHeaders? = nil
        
        headers = ["Content-Type": "application/x-www-form-urlencoded","Accept":"application/json"]
        
        AF.request(strUrl, method : .get, parameters : nil, encoding : URLEncoding.default , headers : headers)
            .validate(statusCode: 200..<501)
            .responseData {
                (dataResponse) in
                
                print(dataResponse.request as Any) // your request
                print(dataResponse.response as Any)
                print(dataResponse.result as Any)// your response
                
                switch dataResponse.result {
                    
                case .success(let data):
                    
                    var jsonResponse  = [String :Any]()
      
                    do {
                        
                        jsonResponse = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String : Any]
                        
                        print(jsonResponse as NSDictionary)
                        sucessBlock(jsonResponse as NSDictionary)
                    }
                    
                    catch
                    {
                        debugPrint("URL: \(strUrl)-->\n Response code: \(dataResponse.response?.statusCode ?? 0)")
                        debugPrint("Error: \(String(describing: dataResponse.error))")
                        debugPrint("Response string: \(String(data: data, encoding: .utf8) ?? "No Response from server")")
                        debugPrint("\(data.description)")
                    }
                    
                case .failure(let error):
                    
                    print(error.errorDescription ?? "Server error")
                    
                    failureBlock(error.errorDescription ?? "Server error")
                }
                
            }
        
    }
}
