//
//  MessageService.swift
//  Slack
//
//  Created by MalikHassnain on 15/06/2019.
//  Copyright © 2019 MalikHassnain. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService{
    static let  instance =  MessageService()
    
    var channels = [Channel]()
    var messages = [Message]()
    var selectedChannel : Channel?
    
    func findAllChannel(completion: @escaping CompletionHander){
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARAR_HEADER).responseJSON { (response) in
            
            if response.result.error == nil {
                guard let data = response.data else {return}
                
//                do{
//                    self.channels = try JSONDecoder().decode([Channel].self, from: data)
//                }catch let error {
//                    debugPrint(error as Any)
//                }
//                print(self.channels)
                if let json = JSON(data).array{
                    for item in json {
                        let name = item["name"].stringValue
                        let desc = item["description"].stringValue
                        let id = item["_id"].stringValue

                        let channel = Channel(channelTitlte: name, channelDesc: desc, id: id)

                        self.channels.append(channel)
                    }
                    NotificationCenter.default.post(name: NOTIF_CHANNEL_LOADED, object: nil)
                    
                     completion(true)
                }
               
               
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func clearMessages(){
        messages.removeAll()
    }
    
    func clearChannels(){
        channels.removeAll()
    }
    
    func getAllMessagesForChannel(channelId : String, completion: @escaping CompletionHander){
        Alamofire.request("\(URL_GET_MESSAGES)/\(channelId)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARAR_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                self.clearMessages()
                
                guard let data = response.data else {return}
                if let json = JSON(data).array{
                    for item in json {
                        let messageBody = item["messageBody"].stringValue
                        let channelId = item["channelId"].stringValue
                        let id = item["_id"].stringValue
                        let userName = item["userName"].stringValue
                        let userAvatar = item["userAvatar"].stringValue
                        let userAvatarColor = item["userAvatarColor"].stringValue
                        let timeStamp = item["timeStamp"].stringValue
                        
                        let message = Message(message: messageBody, userName: userName, channelId: channelId, userAvatar: userAvatar, userAvatarColor: userAvatarColor, id: id, timeStamp: timeStamp)
                        self.messages.append(message)
                        
                    }
                    
                    completion(true)
                }
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}
