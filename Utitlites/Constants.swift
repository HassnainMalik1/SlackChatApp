 //
//  Constants.swift
//  Slack
//
//  Created by MalikHassnain on 08/06/2019.
//  Copyright © 2019 MalikHassnain. All rights reserved.
//

import Foundation

 
 typealias CompletionHander = (_ Success : Bool) -> ()
 
 //Url
 let BASE_URL = "http://localhost:3005/v1/"
 let URL_REGISTER = "http://localhost:3005/v1/account/register"
 let URL_LOGIN = "http://localhost:3005/v1/account/login"
 let URL_ADD_USER = "http://localhost:3005/v1/user/add"
 let URL_USER_BY_EMAIL = "http://localhost:3005/v1/user/byEmail"
 let URL_GET_CHANNELS = "http://localhost:3005/v1/channel"
 
 
 
 //segues
 
 let GO_TO_LOGIN = "goToLogin"
 let To_CREATE_ACCOUNT = "toCreateAccount"
 let UN_WIND_TO_CHANNEL = "unwindToChannel"
 let TO_AVATAR_PICKER = "toAvatarPicker"
 
 //Colors
 let slackPurplePlaceHolder = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 0.5)
 
 //Notification
 let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")
 
 //
 let TOKEN_KEY  =  "token"
 let LOGGED_IN_KEY = "loggedIn"
 let USER_EMAIL = "userEmail"

 //Headers
 
 let HEADER = ["Content-Type" : "application/json; charset=utf-8"]
 
 let BEARAR_HEADER = [
    "Authorization":"Bearer \(AuthService.instance.authToken)",
    
    "Content-Type" : "application/json; charset=utf-8"
 ]
