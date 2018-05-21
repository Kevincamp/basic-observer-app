//
//  ContactListViewModel.swift
//  ObserverApp
//
//  Created by Kevin Campuzano on 5/20/18.
//  Copyright © 2018 Kevin Campuzano. All rights reserved.
//

import Foundation

protocol MessageDelegate: class {
    func update(message: String)
}

class ContactListViewModel {
    public let LOAD_DATA = "LOAD_DATA"
    public let REQUEST_ADD_NEW_USER = "REQUEST_ADD_NEW_USER"
    public let NEW_USER_ADDED = "NEW_USER_ADDED"
    
    public var contactListDelegate: MessageDelegate!
    
    public func loadData(){
        /*
         * Actualizar data de contactos del View Controller
         */
        contactListDelegate.update(message: LOAD_DATA)
    }
}
