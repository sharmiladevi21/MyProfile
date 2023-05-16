

import UIKit


class Helper : NSObject{
    
    static let sharedInstance: Helper = {
        
        let instance = Helper()
        
        // setup code
        return instance
    }()

   

    func isConnectedToNetwork() -> Bool {
        
        if Reachability.isConnectedToNetwork() == true {
            
            return true
            
        } else {
            
            return false
        }
    }

    // Round Corner View
    func setRoundCornerView(aView : UIView)  {
        
        aView.layer.masksToBounds = true
        aView.clipsToBounds = true
        aView.layer.cornerRadius = aView.frame.size.width / 2
        
    }
    
    
    // Round Corner View
    func setCornerViewWithBorder(aView : UIView, cornerRadius:CGFloat,backgroundColor: UIColor,borderColor: UIColor)  {
        
        aView.layer.masksToBounds = true
        aView.backgroundColor = backgroundColor
        aView.layer.borderWidth = 1.0
        aView.layer.cornerRadius = cornerRadius
        aView.layer.borderColor = borderColor.cgColor
    }
        
    // Set border view
    
    func setBorderView(aView : UIView, borderWidth:CGFloat, borderColor:UIColor, cornerRadius:CGFloat)  {
        
        aView.layer.borderWidth = borderWidth
        aView.layer.borderColor = borderColor.cgColor
        aView.layer.masksToBounds = true
        aView.layer.cornerRadius = cornerRadius
    }
   
    

    // MARK : Alert Controller Methods
    
    func showDefaultAlertViewController(aViewController : UIViewController = UIViewController(), alertTitle: String, aStrMessage : String)  {
        
        
        var viewVC = UIViewController()
        if let topController = UIApplication.topViewController() {
            viewVC = topController
        }

        
        let aAlertController = UIAlertController(title: alertTitle, message: aStrMessage, preferredStyle: UIAlertController.Style.alert)
        
        aAlertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        viewVC.present(aAlertController, animated: true, completion: nil)
    }
    func showAlertControllerWithOkActionBlock(aViewController : UIViewController, aStrMessage : String, okActionBlock : @escaping (UIAlertAction) ->())  {
        
        let aAlertController = UIAlertController(title: "Profile", message: aStrMessage, preferredStyle: UIAlertController.Style.alert)
        
        aAlertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { (action) in
            
            okActionBlock(action)
        }))
        
        aViewController.present(aAlertController, animated: true, completion: nil)
    }
    

 
    
  
    func hideLoadingAnimation(_ viewCtrl: UIViewController = UIViewController()) {
        var viewVC = UIViewController()
        if let topController = UIApplication.topViewController() {
            viewVC = topController
        }
        
        viewVC.view.viewWithTag(Int(123456))?.removeFromSuperview()
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.window?.isUserInteractionEnabled = true
    }
    func showLoadingAnimationWithTitle(aViewController:UIViewController = UIViewController(), aStrText : String) {
        
        var viewVC = UIViewController()
        if let topController = UIApplication.topViewController() {
            viewVC = topController
        }

        let storyBoardMenu : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

        let viewProgress = storyBoardMenu.instantiateViewController(withIdentifier: "ProgressHud") as! ProgressHud
        viewProgress.view.tag = Int(123456)
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.window?.isUserInteractionEnabled = true
        viewVC.view.addSubview(viewProgress.view)
    }
    
    

    }
    
 

