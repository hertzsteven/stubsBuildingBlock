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

final class TextFieldPwdShowHideViewController: UIViewController {
    var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        
        // 1. create a button
        let button1 = UIButton(configuration: UIButton.Configuration.filled(),
                               primaryAction: UIAction(title: "Hello From One") { action in
            print(action.title)
            self.shakeButton()
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
        
        // lets create a textField
        textField = {
            let te = UITextField()
            te.translatesAutoresizingMaskIntoConstraints = false
            te.text = "hello"
            te.isSecureTextEntry = true
            te.textAlignment = .center
           
            let button  = enablePasswordToggle()
            
                // put the button on the uitextField
            te.rightView = button
            te.rightViewMode = .always
            button.alpha = 0.7

            return te
        }()
        
        
        
        
        // 4. pass it to the stackView
        setupStackView(button1, label, button2, textField)
        
    }
    
    func enablePasswordToggle() -> UIButton{

        let button = UIButton(type: .custom)
        // set the image on the button
        button.setImage(UIImage(systemName: "pencil.circle" ), for: .normal)
        button.setImage(UIImage(systemName: "pencil.circle.fill"), for: .selected)
        
         // where to place the image on the button
         button.imageEdgeInsets = UIEdgeInsets(top:0, left:-12, bottom:0, right:0)
        
      
         // what the button should do when pressed
         button.addTarget(self,
                            action: #selector(togglePasswordView),
                            for: .touchUpInside)
        return button
        
    }
    
    @objc func togglePasswordView(button: UIButton)  {
        print("executing")
        button.isSelected.toggle()
        textField.isSecureTextEntry.toggle()
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
    
    private func shakeButton() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 10, -10, 10, 0]
        animation.keyTimes = [0, 0.16, 0.5, 0.83, 1]
        animation.duration = 0.4

        animation.isAdditive = true
        textField.layer.add(animation, forKey: "shake")
    }

}
