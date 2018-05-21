//
//  ViewModel.swift
//  ObserverApp
//
//  Created by Kevin Campuzano on 5/17/18.
//  Copyright © 2018 Kevin Campuzano. All rights reserved.
//

/* BOSS */
import Foundation



protocol BossDelegate: class {
    func update(message: String)
}

class ViewModel {
    public let UPDATE_MESSAGE = "UPDATE_MESSAGE"
    
    public var bossDelegate: BossDelegate!

    public func sendRequestToUpdateMessage(){
        bossDelegate.update(message: UPDATE_MESSAGE)
    }
}
