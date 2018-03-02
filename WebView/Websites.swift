//
//  Websites.swift
//  WebView
//
//  Created by Alina on 2/21/18.
//  Copyright © 2018 a2b DesignLabs. All rights reserved.
//

import Foundation


class Websites : Equatable{
    static func ==(lhs: Websites, rhs: Websites) -> Bool {
        return lhs === rhs
    }
    
    var websiteName: String?
    var websiteUrl: String?
    var isFavourite: Bool
    
    init(_ websiteName: String, _ websiteUrl: String, _ isFavourite: Bool){
        self.websiteName = websiteName
        self.websiteUrl = websiteUrl
        self.isFavourite = isFavourite
    }
    
    var getWebsiteName: String? {
        get{
            return websiteName
        }
    }
    var getWebsiteUrl: String? {
        get{
            return websiteUrl
        }
    }
    
    var getIsFavouriteState: Bool {
        get{
            return isFavourite
        }
    }
}
