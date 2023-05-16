
import Foundation
struct ResponseCode {

    static let kRESPONSE_CODE_DATA = "200"

    static let kRESPONSE_CODE_ACCESS_DENIED = "403"

    static let kRESPONSE_CODE_NO_DATA = "204"
    static let kRESPONSE_CODE_INVAILD_USER_TOKEN = "401"
    static let kRESPONSE_CODE_MISSING_FIELDS = "201"
    static let kRESPONSE_CODE_UNAUTH_ERROR = "403"
    static let kRESPONSE_CODE_MANDATORY_ERROR = "422"
    static let kRESPONSE_CODE_APPLE_MANDATORY_ERROR = "423"

    static let kRESPONSE_ALREADYEXIST_ERROR = "409"

    static let kRESPONSE_SERVER_ERROR = "500"


}

struct ResponseType {
    static let kRESPONSE_SUCCESS = "success"
    static let kRESPONSE_FAILURE = "failure"
    static let kRESPONSE_DELETE = "delete"
    static let kRESPONSE_ADD = "add"
    static let kRESPONSE_STATUS_CHANGE = "Active/Inactive"
    static let kRESPONSE_UPDATED_ANSWER = "Updated"
    static let kRESPONSE_SUCCESS_RELOAD = "Reload"


    static let kRESPONSE_CHANGEROLE = "changeRole"
    static let kRESPONSE_ENABLEDISABLE_STATUS = "enabledisable"
    static let kRESPONSE_ENABLE = "enable"
    static let kRESPONSE_DISABLE = "disable"
    static let kRESPONSE_HOST_LOOKUP = "host"
    static let kRESPONSE_VISITOR_PASS = "visitor_pass"

}
