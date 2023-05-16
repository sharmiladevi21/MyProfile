

import Foundation
import Combine


class ProfileViewModel {
    
    private var profileData = [Result]()
    var delegate : SuccessAndErrorHandling?
    
    //MARK: - Getter Method
    
    func getProfileData() -> Result?{
        return profileData.first
    }

    //MARK: - API METHODS

    func callProfileListAPI() {

        if !HELPER.isConnectedToNetwork() {
            
            HELPER.showDefaultAlertViewController(alertTitle: "Profile", aStrMessage: "No Internet")
            return
        }
        HELPER.showLoadingAnimationWithTitle(aStrText: "")
        profileData.removeAll()
        
        NetworkManager.shared.callGetApi(strUrl: "https://randomuser.me/api/", sucessBlock: { [weak self] response in
            
            HELPER.hideLoadingAnimation()
            
            if response.count != 0 {
                
                
                do {
                    
                    var aDictResponseData = [String:Any]()
                    aDictResponseData = response as? [String : Any] ?? [:]
                    
                    let jsonData = try JSONSerialization.data(withJSONObject: aDictResponseData, options: .prettyPrinted)
                     //let item = try! JSONDecoder().decode(Profile.self, from: jsonData)
                    guard let item = try? JSONDecoder().decode(Profile.self, from: jsonData) else {
                        return
                    }
                    self?.profileData = item.results
                    
                    self?.delegate?.successWithData(for: ResponseType.kRESPONSE_SUCCESS, index: 0)
                    
                } catch {
                    print(error.localizedDescription)
                }
            }else {
                    self?.delegate?.errorWithData(errorCode: "204", errorMsg: "No data found")

                }
            
            
            }, failureBlock: { [weak self] error in
                HELPER.hideLoadingAnimation()
                self?.delegate?.errorWithData(errorCode: "", errorMsg: error)

        })
    }
}
    
