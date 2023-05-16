
import UIKit

class ProfileViewController: UIViewController {

    let profileviewmodel = ProfileViewModel()
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        loadModel()
    }
    func loadModel(){
        profileviewmodel.delegate = self
        profileviewmodel.getProfileList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)

    }


}
extension ProfileViewController : sendBackData {
    func updateProfileInfo(result: Profile) {
        print(result)
    }
}

extension ProfileViewController : SuccessAndErrorHandling {
    func successWithData<T>(for data: T, index: Int) {
        if let data = data as? String {
            if data == ResponseType.kRESPONSE_SUCCESS{
                self.loadModel()

            }else if data == ResponseType.kRESPONSE_SUCCESS_RELOAD {
                //self.notificationTbleView.reloadData()
            }
           else if data == ResponseCode.kRESPONSE_CODE_NO_DATA{
                //self.notificationTbleView.reloadData()
                //self.view.toast(ALERT_TYPE_NO_DATA)
            }
        }
    }
}



