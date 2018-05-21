//
//  NewContactViewModel.swift
//  ObserverApp
//
//  Created by Kevin Campuzano on 5/20/18.
//  Copyright © 2018 Kevin Campuzano. All rights reserved.
//

import Foundation

class NewContactViewModel {
    public let NEW_CONTACT_ADDED = "NEW_CONTACT_ADDED"
    
    public var newContactDelegate: MessageDelegate!
    
    public func addContactWithData(nickName: String, fullName: String, emailAddress:String){
        let newContact = Contact(nickNameContact: nickName, fullNameContact: fullName, emailAddressContact: emailAddress)
        contactList.append(newContact)
        newContactDelegate.update(message: NEW_CONTACT_ADDED)
    }
}
