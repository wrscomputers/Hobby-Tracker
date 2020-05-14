//
//  NewFriendViewController.swift
//  HobbyTracker
//
//  Created by Jason Hoover on 5/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

// The two kinds of requests are:
//  - A request for some information (numberOfRows). It's a function that has a return type
//  - A request to do something on the delegator's behalf. (Add a friend to the array that it doesn't have direct access to itself.)

protocol AddFriendDelegate {
    func friendWasCreated(friend: Friend)
}

class NewFriendViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var hometownTextField: UITextField!
    @IBOutlet weak var hobby1TextField: UITextField!
    @IBOutlet weak var hobby2TextField: UITextField!
    @IBOutlet weak var hobby3TextField: UITextField!
    
    var delegate: AddFriendDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func save(_ sender: Any) {
        
        // Grab the name and hometown
        guard let name = nameTextField.text,
            let hometown = hometownTextField.text else { return }
        
        // Get the hobbies
        var hobbies: [String] = []
        
        if let hobby1 = hobby1TextField.text,
            hobby1 != "" {
            hobbies.append(hobby1)
            
        }
        
        if let hobby2 = hobby2TextField.text,
            hobby2 != "" {
            hobbies.append(hobby2)
            
        }
        
        if let hobby3 = hobby3TextField.text,
            hobby3 != "" {
            hobbies.append(hobby3)
            
        }
        
        
        // Create a Friend object
        
        let friend = Friend(name: name, hometown: hometown, hobbies: hobbies)
        
        // Add it to the friends array in the other view controllers.
        //Tell the delegate that a friend was created so it can add the friend we give it to the 'var friends' array
        
        delegate?.friendWasCreated(friend: friend)
        
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
