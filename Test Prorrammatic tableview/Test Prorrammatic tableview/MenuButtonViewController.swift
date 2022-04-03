
    //  StartViewController.swift
    //  Test Prorrammatic tableview
    //
    //  Created by Steven Hertz on 3/8/22.
    //
    // a starter stube
    // - creates 2 buttons
    // - also a Label
    //

import UIKit

final class MenuButtonViewController: UIViewController {
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        
        // 1. create a button
        let button1 = UIButton(configuration: UIButton.Configuration.filled(),
                               primaryAction: UIAction(title: "Hello From One") { action in
            print(action.title)
        }
        )

      
        // 2. create a label
      let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.text = "Something to say"
        return label
      }()
      
        // 3. create a second buttton
      let button2 = UIButton(configuration: UIButton.Configuration.filled())
      button2.setTitle("This is for the button", for: .normal)
      
      var menuItems: [UIAction] {
        return [
          UIAction(title: "Standard item", image: UIImage(systemName: "sun.max"), handler: { (action) in
            print(action.title)}),
          UIAction(title: "Disabled item", image: UIImage(systemName: "moon"), attributes: .disabled, handler: { (_) in
          }),
          UIAction(title: "Delete..", image: UIImage(systemName: "trash"), attributes: .destructive, handler: { (_) in
          })
        ]
      }
      
      var demoMenu: UIMenu {
        return UIMenu(title: "My menu", image: nil, identifier: nil, options: [], children: menuItems)
      }
      
      button2.menu = demoMenu
      button2.showsMenuAsPrimaryAction = true
      
      
      
            // 4. pass it to the stackView
        setupStackView(button1, label, button2)
        
    }
    
        // stackView gets created and get cofigured into the view
    fileprivate func setupStackView(_ views: UIView...) {
            // Instantiate the StackView
        let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.spacing = 16
            stackView.axis = .vertical
            stackView.distribution = .fill
            stackView.alignment = .fill
            return stackView
        }()
        
        views.forEach { btn in
            stackView.addArrangedSubview(btn)
        }
        
        view.addSubview(stackView)
        stackView.centerOfsuperView() // using my helper extension on UIView
    }
    
}
