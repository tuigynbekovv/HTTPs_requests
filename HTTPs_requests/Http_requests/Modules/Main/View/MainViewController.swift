/*
 *  MainViewController.swift
 *  HTTP_requests
 *
 *  Created by tuigynbekov on 2/9/21.
 */

import UIKit
class MainViewController: UIViewController {
    // MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        getFromPostman()
    }
    
    
    // MARK:- Autolayout
    func setupViews() {
        view.backgroundColor = UIColor.orange.withAlphaComponent(0.3)
    }
}


extension MainViewController {
    // MARK:- Requests
    private func getFromPostman() {
        ParseManager.shared.getRequest(url: "get", parameters: nil) { (result: CheckRequest?, error) in
            if let error = error {
                print(error)
            }
            print(result ?? "Result is empty")
        }
    }
}
