    //
    //  StartViewController.swift
    //  Test Prorrammatic tableview
    //
    //  Created by Steven Hertz on 3/8/22.
    //

import UIKit

final class StartViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        
        
        let button1 = UIButton(configuration: UIButton.Configuration.filled(),
                               primaryAction: UIAction(title: "Hello From One") { action in
            print(action.title)
        }
        )
        
        
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
        

        let button2 = UIButton(configuration: UIButton.Configuration.filled(),
                               primaryAction: UIAction(title: "Hello From The second one") { action in
            print(action.title)
        }
        )
        
        setupStackView(button1, label, button2)
        
    }
    
    
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
//        stackView.addArrangedSubview(button1)
//        stackView.addArrangedSubview(button2)
//
        view.addSubview(stackView)
        stackView.centerOfsuperView()
    }

}
