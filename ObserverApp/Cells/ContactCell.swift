//
//  ContactCell.swift
//  ObserverApp
//
//  Created by Kevin Campuzano on 5/20/18.
//  Copyright © 2018 Kevin Campuzano. All rights reserved.
//

import UIKit

struct ContactCellViewModel {
    let contact: Contact
    
    var nickName: String {
        return contact.nickNameContact
    }
    
    var fullName: String {
        return contact.fullNameContact
    }
    
    var emailAddress: String {
        return contact.emailAddressContact
    }

}


final class ContactCell: UITableViewCell {
    static let Identifier = "ContactCell"
    
    @IBOutlet weak var nickNameTextField: UILabel!
    @IBOutlet weak var fullNameTextField: UILabel!
    @IBOutlet weak var emailAddressTextField: UILabel!
    
    var viewModel: ContactCellViewModel? {
        didSet {
            if let viewModel = viewModel {
                nickNameTextField.text = viewModel.nickName
                fullNameTextField.text = viewModel.fullName
                emailAddressTextField.text = viewModel.emailAddress
            }
        }
    }
    
}
