//
//  ViewController.swift
//  screen objects
//
//  Created by Steven Hertz on 4/6/22.
//

import UIKit

class ViewController: UIViewController {

    fileprivate func placeTextFielldOnScreen(_ textField: UITextField) {
            // place the field
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
        textField.frame = CGRect(x: 20, y: 200, width: view.frame.size.width - 40, height: 55)
        textField.becomeFirstResponder()
    }
    
    fileprivate func makeNewVC() {
        let barButtonItem = UIBarButtonItem(title: "pressit", image: nil, primaryAction: UIAction(handler: { (action) in print("djdjdj")})  , menu: nil)
        let secondvc = UIViewController()
        secondvc.navigationItem.rightBarButtonItem = barButtonItem
        secondvc.view.backgroundColor = .systemGray2
        let nc = UINavigationController(rootViewController: secondvc)
        present(nc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create a text field and put it somewhere
        
        // create the textField
        let textField: UITextField = {
            let field = UITextField()
            field.textAlignment = .center
            field.placeholder = "Enter name ..."
            field.backgroundColor = .systemGray2
        
            return field
        }()
        
        let button: UIButton = {
            let button = UIButton(type: .system, primaryAction: UIAction(handler: { (action) in
                print("djdjdj")
                self.makeNewVC()
            }) )
            // button.showsMenuAsPrimaryAction = true
            return button
        }()
        
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        button.backgroundColor = .systemTeal
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.center = view.center
        
        
        
//        makeNewVC()
        placeTextFielldOnScreen(textField)
    }


}

