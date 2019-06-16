//
//  SocketService.swift
//  Slack
//
//  Created by MalikHassnain on 16/06/2019.
//  Copyright © 2019 MalikHassnain. All rights reserved.
//

import UIKit
import SocketIO
class SocketService: NSObject {

    static let  instance = SocketService()
    
    let manager : SocketManager
    let socket : SocketIOClient
    
    override init() {
        self.manager = SocketManager(socketURL: URL(string: BASE_URL)!)
        self.socket = manager.defaultSocket
        super.init()
    }
    
    func establishConnection(){
        socket.connect()
    }
    
    func closeConnection()  {
        socket.disconnect()
    }
    
    
    func addChannel(channelName : String, channelDesc : String, completion: @escaping CompletionHander)  {
        socket.emit("newChannel", channelName, channelDesc)
        completion(true)
    }
    
    
    func getChannel(completion : @escaping CompletionHander){
        socket.on("channelCreated") { (dataArray, ack) in
            guard let channelName = dataArray[0] as? String else {return}
            guard let channelDesc = dataArray[1]  as? String else {return}
            
            guard let channelId = dataArray[2] as? String else {return}
            
            
            let newChannel = Channel(channelTitlte: channelName, channelDesc: channelDesc, id: channelId)
            MessageService.instance.channels.append(newChannel)
            completion(true)
        }
    }
    
}
