//
//  ViewController.swift
//  shopping-list
//
//  Created by Bradley Chesworth on 13/02/2020.
//  Copyright © 2020 Brad Chesworth. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    private var items = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Shopping List"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        
        toolbarItems = [spacer, addButton]
          
        navigationController?.isToolbarHidden = false
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    @objc private func addItem() {
        let ac = UIAlertController(title: "Enter Item", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] _ in
            guard let submission = ac?.textFields?[0].text else { return }
            self?.items.insert(submission, at: 0)
            let indexPath = IndexPath(row: 0, section: 0)
            self?.tableView.insertRows(at: [indexPath], with: .automatic)
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
    }

}

