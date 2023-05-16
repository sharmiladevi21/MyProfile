//
//  ProgressHud.swift
//  Spotz
//
//  Created by Mani kandan on 02/08/17.
//  Copyright © 2017 Baap Technologies Pvt Ltd. All rights reserved.
//

import UIKit
import Foundation

class ProgressHud : UIViewController
{
    @IBOutlet var viewLoader: UIView!
    @IBOutlet var lblTitle: UILabel!

    var activityIndicatorView : NVActivityIndicatorView!
    var isSmallLoader:Bool = false
    var strText = ""
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        addProgress()
    }
    
    func addProgress()
    {
        lblTitle.text = strText
        let frame = CGRect(x: 5, y: 5, width: viewLoader.frame.size.height - 10, height: viewLoader.frame.size.height - 10)
        activityIndicatorView = NVActivityIndicatorView(frame: frame, type: NVActivityIndicatorType.circleStrokeSpin)
        activityIndicatorView.color = #colorLiteral(red: 0.05646989495, green: 0.3465346694, blue: 0.6030848026, alpha: 1)
        viewLoader.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        activityIndicatorView.stopAnimating()
    }
}
