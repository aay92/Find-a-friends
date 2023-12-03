//
//  ModelChat.swift
//  Find a friend
//
//  Created by Aleksey Alyonin on 03.12.2023.
//

import UIKit
import MessageKit

///Sender - кто отправляет сообщение
struct Sender: SenderType {
    var senderId: String
    var displayName: String
}

///Message - само сообщение
struct Message: MessageType {
    var sender: MessageKit.SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKit.MessageKind
}
