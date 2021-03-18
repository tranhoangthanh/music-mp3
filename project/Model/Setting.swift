//
//  Setting.swift
//  project
//
//  Created by thanh on 7/22/20.
//  Copyright © 2020 tranthanh. All rights reserved.
//

import UIKit
import SwiftyJSON



struct Popup {

    var popupImage : String!
    var popupUrl : String!

    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(json: JSON!){
        if json.isEmpty{
            return
        }
        popupImage = json["popup_image"].stringValue
        popupUrl = json["popup_url"].stringValue
    }
}

struct Setting {
       var about : String!
       var faq : String!
       var help : String!
       var policy : String!
       var term : String!
       var theme : [String]!
    
       var popup  : Popup!
    
     
    init(json: JSON!){
        if json.isEmpty{
            return
        }
        about = json["about"].stringValue
        faq = json["faq"].stringValue
        help = json["help"].stringValue
        policy = json["policy"].stringValue
        term = json["term"].stringValue
        theme = [String]()
               let themeArray = json["theme"].arrayValue
               for themeJson in themeArray{
                   theme.append(themeJson.stringValue)
              }
        let popUpJson = json["popup"]
        popup = Popup(json: popUpJson)
    
    }
    
    
    
}



