//
//  StoryBoardObjects.swift
//  eBuddy
//
//  Created by Dreamguys on 12/07/21.
//

import UIKit

// Storyboard
private let INDEXSTORYBOARD = UIStoryboard(name: "Main", bundle: nil)


final class GlobalStoryBoard: NSObject {
    
    //Mark: - Index View Controller
    
    var profileVC : ProfileViewController {
        return INDEXSTORYBOARD.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
    }


}
