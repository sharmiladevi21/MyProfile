
import UIKit

// Storyboard
private let INDEXSTORYBOARD = UIStoryboard(name: "Main", bundle: nil)


final class GlobalStoryBoard: NSObject {
    
    //Mark: - Index View Controller
    
    var profileVC : ProfileViewController {
        return INDEXSTORYBOARD.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
    }


}
