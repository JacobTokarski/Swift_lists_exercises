//
//  ViewController.swift
//  List1
//
//  Created by Jakub Tokarski on 25/02/2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showalert(sender: UIButton) {
        let alertController = UIAlertController(title: "Witaj w naszej aplikacji!", message: "Witaj to ja", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}


