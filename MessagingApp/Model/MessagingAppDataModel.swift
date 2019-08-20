//
//  MessagingAppDataModel.swift
//  MessagingApp
//
//  Created by fordlabs on 14/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import Foundation
import UIKit
struct MessagingAppDataModel{
    var name: String
    var textMessage: [TextMessage]
}

struct TextMessage {
    var text: String
    var receivedMessage: Bool
}

class Data {
    static var data = [ MessagingAppDataModel(name: "Prasanna", textMessage: [TextMessage(text: "Hey Pawan,you are awesome", receivedMessage: true), TextMessage(text: "yes, yes I know. Tell me something new.", receivedMessage: false)]), MessagingAppDataModel(name: "Gowatham", textMessage: [TextMessage(text: "Hey Pawan", receivedMessage: true), TextMessage(text: "Have you completed", receivedMessage: false)]), MessagingAppDataModel(name: "Bindu", textMessage: [TextMessage(text: "Pawan, yaar tu kitta achha haiii ?", receivedMessage: true), TextMessage(text: "han par tu to chutiya hi haii", receivedMessage: false)])]

}

