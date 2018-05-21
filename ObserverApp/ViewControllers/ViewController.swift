//
//  ViewController.swift
//  ObserverApp
//
//  Created by Kevin Campuzano on 5/17/18.
//  Copyright © 2018 Kevin Campuzano. All rights reserved.
//

/* INTERN */
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnAction: UIButton!
    @IBOutlet weak var lblAction: UILabel!
    
    var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ViewModel()
        viewModel.bossDelegate = self
    }
    
    @IBAction func didTapCallToObserverButton(_ sender: UIButton) {
        viewModel.sendRequestToUpdateMessage()
    }
    
}

extension ViewController: BossDelegate {
    
    func update(message: String) {
        
        if(message.elementsEqual(viewModel.UPDATE_MESSAGE)){
            lblAction.text = "Receive message from observer"
        }
    }
    
}
