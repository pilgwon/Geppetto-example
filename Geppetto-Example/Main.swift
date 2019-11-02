//
//  Main.swift
//  Geppetto-Example
//
//  Created by PilGwonKim on 2019/11/02.
//  Copyright © 2019 Geppetto. All rights reserved.
//

import Foundation

struct Main: Program {
    
    typealias Environment = Unit
    
    struct Model: Copyable, ModelType {
        var welcomeText: String
        
        static var initial: Self {
            return Model(
                welcomeText: ""
            )
        }
    }
    
    enum Message {
        case updateWelcomeText
    }
    
    static var initialCommand: Command {
        return .none
    }
    
    static func update(model: Model, message: Message) -> (Model, Command) {
        switch message {
        case .updateWelcomeText:
            return (model.copy {
                $0.welcomeText = "WELCOME!"
            }, .none)
        }
    }
}

