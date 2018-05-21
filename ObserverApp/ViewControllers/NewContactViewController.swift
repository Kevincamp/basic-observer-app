//
//  NewContactViewController.swift
//  ObserverApp
//
//  Created by Kevin Campuzano on 5/20/18.
//  Copyright © 2018 Kevin Campuzano. All rights reserved.
//

import UIKit

final class NewContactViewController: UIViewController {
    
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    
    private var viewModel: NewContactViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = NewContactViewModel()
        viewModel.newContactDelegate = self
    }
}


/*
 * MARK: OBSERVER MESSAGES
 */
extension NewContactViewController: MessageDelegate {
    
    func update(message: String) {
        if (message.elementsEqual(viewModel.NEW_CONTACT_ADDED)){
            sendToContactList()
            return
        }
    }
}


/*
 * MARK: ACTIONS AND UNWINDS
 */
extension NewContactViewController {
    
    @IBAction func createContact_TouchUpInside() {
        guard let nickName = nickNameTextField.text else {
            return
        }
        
        guard let fullName = fullNameTextField.text else {
            return
            
        }
        
        guard let emailAddress = emailAddressTextField.text else {
            return
        }
        
        viewModel.addContactWithData(nickName: nickName, fullName: fullName, emailAddress: emailAddress)
    }
    
    private func sendToContactList(){
        
        performSegue(withIdentifier: "UNWIND_WITH_NEW_CONTACT", sender: self)
        
    }
    
}
