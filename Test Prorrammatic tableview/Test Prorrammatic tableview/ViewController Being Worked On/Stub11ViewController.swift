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

struct PostUserProfileImage: Codable {
  let medium: String
}

struct PostUser: Codable {
  let profile_image: PostUserProfileImage
}

struct PostUrls: Codable {
  let regular: String
}

struct Post: Codable {
  let id: String
  let description: String?
  let user: PostUser
  let urls: PostUrls
}

fileprivate struct APIResponse: Codable {
  let results: [Post]
}

final class Stub11ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let accessKey = "bbc33cc9f86e189e1387e31a57dbd74a2dba4a5f4540f7a0dbcb599fd72f61f2"
        
        guard let theURL = URL(string: "https://api.unsplash.com/search/photos?query=puppies") else {
            fatalError("error converting url")
        }
        
        var req = URLRequest(url: theURL)
        req.addValue("Client-ID \(accessKey)", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: req) { data, response, error in
            guard let data = data else {
                fatalError("data not retreived")
            }
            print(String(decoding: data, as: UTF8.self))
            // do the decoding from here
            
            do {
                let response = try JSONDecoder().decode(APIResponse.self, from: data)
                response.results.forEach {
                    print($0.description)
                }
            } catch let error {
                print("error decoding the response")
            }
            
        }
        task.resume()
        
        
//        setupView()
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
        let button2 = UIButton(configuration: UIButton.Configuration.filled(),
                               primaryAction: UIAction(title: "Hello From The second one") { action in
            print(action.title)
        }
        )
        
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
