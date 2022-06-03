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

 struct APIResponse: Codable {
  let results: [Post]?
}

final class Stub11ViewController: UIViewController, UITableViewDataSource {
    
    let tableView = UITableView()
    let items = ["one",
                 "two",
                 "three",
                 "four",
                 "five",
                 "six",
                 "seven",
                 "eight",
                 "nine",
                 "ten"
    ]
    
    let networker = NetworkManager.shared
    
    var apiResponse = APIResponse(results: [])
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableViewSetup()
        getTheData()
        
        
 
//        setupView()
    }
    
    fileprivate func tableViewSetup() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        
        view.addSubview(tableView)
        
//        tableView.sizeAsPctOfsuperViewAndCenter(pctOfSuperView: 0.5)
        
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//            tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//

    }
    
    fileprivate func getTheData() {
        
        print(" in \(#function) at line \(#line)")
    
        let accessKey = "bbc33cc9f86e189e1387e31a57dbd74a2dba4a5f4540f7a0dbcb599fd72f61f2"
        
        guard let theURL = URL(string: "https://api.unsplash.com/search/photos?query=puppies") else {
            fatalError("error converting url")
        }
        
        var req = URLRequest(url: theURL)
        req.addValue("Client-ID \(accessKey)", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: req) {  data, response, error in
            
            if error != nil {
                print("there was an error")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print(response)
              return
            }

            
            guard let data = data else {
                fatalError("data not retreived")
            }
            print(String(decoding: data, as: UTF8.self))
             //do the decoding from here
            print(" in \(#function) at line \(#line)")
            do {
                let xxxx = try JSONDecoder().decode(APIResponse.self, from: data)
                self.apiResponse = xxxx
//                print(" in \(#function) at line \(#line)")
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
//                self.apiResponse.results.forEach {
//                    print($0.description as Any)
//
//                }
            } catch let error {
                print("error decoding the response \(error)")
            }
            
        }
        task.resume()
        
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

    //
    extension Stub11ViewController  {
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let ip = indexPath
            print(" in \(#function) at line \(#line)")
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

            guard let post = apiResponse.results?[indexPath.row] else {fatalError("sorry charlie")}

            
            print(post.description ?? "no description")
            cell.textLabel?.text = post.description
            
            
            func image(data: Data?) -> UIImage? {
              if let data = data {
                return UIImage(data: data)
              }
              return UIImage(systemName: "picture")
            }
            
            print("before network image")
            networker.image(post: post) { data, error  in
              let img = image(data: data)
              DispatchQueue.main.async {
                  print("in dispatch que")
//                  let image = UIImage(systemName: "pencil.slash")
//                  cell.imageView?.image = image

               // if (cell.representedIdentifier == representedIdentifier) {
                  cell.imageView?.image = img
//                  cell.layoutIfNeeded()
                  cell.layoutSubviews()
               // }
              }
            }


            return cell
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            apiResponse.results?.count ?? 0
        }
    }


