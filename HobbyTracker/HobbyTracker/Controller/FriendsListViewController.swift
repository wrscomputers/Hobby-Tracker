//
//  FriendsListViewController.swift
//  HobbyTracker
//
//  Created by Jason Hoover on 5/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class FriendsListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var friends: [Friend] = [Friend(name: "Bob", hometown: "Salt Lake City", hobbies: ["Football","Soccer","Wrestling"])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Tell the table view that we (the view controller) are going to be its data source (meaning, we will help it get the information it needs)
        tableView.dataSource = self
        
        
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalNewFriend" {
            let newFriendVC = segue.destination as? NewFriendViewController
            
            // "Hey newFriendVC, I'm the one to talk to in order to add a friend to the array"
            newFriendVC?.delegate=self
        }
    }
    
}


extension FriendsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendTableViewCell else {
            fatalError("Cell identifier is wrong or the cell is not of type of expected type friendTableViewCell")
        }
        
        let friend = friends[indexPath.row]
        
        cell.nameLabel.text = friend.name
        cell.hometownLabel.text = friend.hometown
        cell.hobbiesLabel.text = "\(friend.hobbies.count) hobbies"
        
        return cell
    }
    
}
// "I will follow the rules to add a new friend!"
extension FriendsListViewController: AddFriendDelegate {
    func friendWasCreated(friend: Friend) {
        friends.append(friend)
        tableView.reloadData()
    }
}
