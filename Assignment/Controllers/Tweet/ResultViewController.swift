//
//  ResultViewController.swift
//  Assignment
//
//  Created by VuongTC on 9/12/18.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

class ResultViewController: BaseViewController {
    @IBOutlet var mainTableView: VTTableView!
    var messages: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.registerCell(className: ResultCell.className)
    }
    
    @IBAction func okTapped(_ sender: Any) {
        self.alertMessage(message: "This function will be implemented in next version")
    }
}

extension ResultViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ResultCell.className) as? ResultCell
        let data = messages[indexPath.row]
        cell?.configure(with: data)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
