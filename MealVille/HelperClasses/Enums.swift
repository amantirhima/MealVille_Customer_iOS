//  Enums.swift
//  Learning
//  Created by Amandeep tirhima on 2020-01-20.
//  Copyright © 2020 Amandeep tirhima. All rights reserved
import Foundation
import UIKit

//MARK:- STORYBOARD NAMES
enum ENUM_STORYBOARD<T:UIViewController>:String {
    case main = "Main"
    
    func instantiativeVC() -> T {
        let sb = UIStoryboard(name: self.rawValue, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: String(describing: T.self)) as! T
        return vc
    }
}


enum AlertWarnings:String{
    case error = "Error"
    case warning = "Warning"
}

enum AlertButtonTexts:String{
    case ok = "Ok"
    case cancel = "Cancel"
}


enum ENUMCOLOUR {
    
    case themeColour
    case ButtonUserInteractionColorDisable
        
    func getColour() -> UIColor {
        
        switch self {
        case .themeColour: return UIColor.init(red: 215/255, green: 34/255, blue: 41/255, alpha: 1.0)
        case .ButtonUserInteractionColorDisable: return UIColor.init(red: 154/255, green: 205/255, blue: 50/255, alpha: 1.0)
        }
    }
}



