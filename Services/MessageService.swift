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
                     completion(true)
                }
               
               
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}
