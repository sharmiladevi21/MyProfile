//
//  ErrorHandingProtocol.swift
//  HDVisitors
//
//  Created by Dreamguys on 29/08/22.
//

import Foundation
import UIKit

protocol SuccessAndErrorHandling : AnyObject {
    func successWithData <T>(for data : T,index: Int)
    func errorWithData (errorCode : String,errorMsg : String)
    
}

extension SuccessAndErrorHandling {

    func errorWithData(errorCode: String, errorMsg: String) {
        
        HELPER.showDefaultAlertViewController(alertTitle: "Alert", aStrMessage: errorMsg)
    }
    
}
