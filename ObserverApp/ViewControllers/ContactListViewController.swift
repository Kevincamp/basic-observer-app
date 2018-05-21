//
//  ContactListViewController.swift
//  ObserverApp
//
//  Created by Kevin Campuzano on 5/20/18.
//  Copyright © 2018 Kevin Campuzano. All rights reserved.
//


var contactList:[Contact] = []

import Foundation
import UIKit

final class ContactListViewController: UIViewController {
    
    @IBOutlet weak var contactTableView: UITableView!
    
    private var viewModel: ContactListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ContactListViewModel()
        viewModel.contactListDelegate = self
        viewModel.loadData()
    }
    
}

/*
 * MARK: OBSERVER MESSAGES
 */
extension ContactListViewController: MessageDelegate {
    func update(message: String) {
        
        if(message.elementsEqual(viewModel.LOAD_DATA)){
            contactTableView.reloadData()
            return
        }
        
    }
}

/*
 * MARK: TABLE VIEW DELEGATE AND DATA SOURCE
 */
extension ContactListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contactIterator = contactList[indexPath.row]
        let cell =  tableView.dequeueReusableCell(withIdentifier: ContactCell.Identifier, for: indexPath) as! ContactCell
        cell.viewModel = ContactCellViewModel(contact: contactIterator)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
}

/*
 * MARK: ACTIONS AND UNWINDS
 */
extension ContactListViewController {
    
    @IBAction func createContact_TouchUpInside() {
        performSegue(withIdentifier: "CREATE_CONTACT_SEGUE", sender: self)
    }
    
    @IBAction func contactAdded_UnwindSegue(segue:UIStoryboardSegue){
        viewModel.loadData()
    }
    
}
