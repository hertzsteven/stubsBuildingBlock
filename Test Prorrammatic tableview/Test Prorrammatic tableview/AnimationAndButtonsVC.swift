//
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


final class AnimationAndButtonsVC: UIViewController {
    

    lazy var myNewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textColor = .systemTeal
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.text = "lorum ipson and more"
        label.alpha = 1.0
        return label
    }()

    lazy var myNewButton: UIButton = {
        let button = UIButton(primaryAction: UIAction(title: "Force It") { action in
            print("hello ", action.title)
        }
        )
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        
        return button
    }()

 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         setupView()
    }
    
    private func setupView() {
        
        let buttonY = UIButton()
        
        
        let buttonx = UIButton(primaryAction: UIAction  { _ in
            print("in new button")
            }
        )
        buttonx.configuration = .filled()
        buttonx.setTitle("qwertyytrewq", for: .normal)
        
        // 1. create a button
        let button1 = UIButton(configuration: UIButton.Configuration.filled(),
                               primaryAction: UIAction(title: "Hello From One") { action in
            print(action.title)
            self.animateMyLabel()
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
        let button2 = UIButton(configuration: UIButton.Configuration.filled(),
                               primaryAction: UIAction(title: "Hello From The second one") { action in
            print(action.title)
        }
        )
        
        // 4. pass it to the stackView
        setupStackView(button1, label, button2, myNewLabel, myNewButton)
        
        // add buttonx to the subview
        view.addSubview(buttonx)
        
        // take off translcontraints
        buttonx.translatesAutoresizingMaskIntoConstraints = false
        
        // do the left and bottom achor
        buttonx.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 8).isActive = true
        buttonx.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
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

extension AnimationAndButtonsVC {
    func animateMyLabel() -> Void {
        UIView.animate(withDuration: 3.0) { [unowned selfy = self] in
            selfy.myNewLabel.alpha = 0.1
        }
    }
    
}
