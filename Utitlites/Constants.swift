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
 let BASE_URL = "https://localhost:3005/v1/"
 let URL_REGISTER = "http://localhost:3005/v1/account/register"
 
 //segues
 
 let GO_TO_LOGIN = "goToLogin"
 let To_CREATE_ACCOUNT = "toCreateAccount"
 let UN_WIND_TO_CHANNEL = "unwindToChannel"
 
 //
 let TOKEN_KEY  =  "token"
 let LOGGED_IN_KEY = "loggedIn"
 let USER_EMAIL = "userEmail"
