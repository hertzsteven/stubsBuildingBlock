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

enum SomeError: Error {
    case thisError, thatError
}

struct ToDo: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

final class WorkForInterview: UIViewController {
    
    private lazy var myTableView: UITableView = {
        let myTableView = UITableView()
        
        myTableView.register(InterviewTableViewCell.self,
                             forCellReuseIdentifier: InterviewTableViewCell.reuseIdentifier)
        myTableView.delegate = self
        myTableView.dataSource = self
        
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.backgroundColor = .systemGray

        view.addSubview(myTableView)
        myTableView.leftAnchor.constraint(equalToSystemSpacingAfter: view.leftAnchor, multiplier: 2).isActive = true
        view.rightAnchor.constraint(equalToSystemSpacingAfter: myTableView.rightAnchor, multiplier: 2).isActive = true
        myTableView.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 2).isActive = true
        view.bottomAnchor.constraint(equalToSystemSpacingBelow: myTableView.bottomAnchor, multiplier: 2).isActive = true


        return myTableView
    }()
    
    override func loadView() {
        super.loadView()
        print("\((#file as NSString).lastPathComponent), \(#function), \(#line)")
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print("in custom initializer")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        print("in review for interview")
                
        myTableView.reloadData()
//        myTableView.delegate = self
//        myTableView.dataSource = self
//        myTableView.register(InterviewTableViewCell.self,
//                             forCellReuseIdentifier: InterviewTableViewCell.reuseIdentifier)
        
        setupView()
        
        getMockData() {result in
            switch result {
            case .failure(let err):
                print("failure")
            case .success(let thing):
                print("sucess")
            }
        }
    }
    
    fileprivate func getMockData(processWith completionHandler: @escaping (_ thing: Result<Any,Error>) -> Void )  {
        
        let session: URLSession = {
            let config = URLSessionConfiguration.default
            return URLSession(configuration: config)
        }()
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1") else {fatalError("did not work")}
        _ = URLRequest(url: url)
        
        let dataTask = session.dataTask(with: url) { data, response, error in
            
            guard error == nil else {
                let result: Result<Any,Error> = Result.failure(SomeError.thisError)
                completionHandler(result)
                return
                    //                fatalError("error not nil")
            }
            
            guard let data = data else {
                fatalError("getting the data")
            }
            
            let jsonString = String(data: data, encoding: .utf8)
            let jsondecoder = JSONDecoder()
            guard let todo = try? jsondecoder.decode(ToDo.self, from: data) else {fatalError("decoding failed")}
            let result: Result<Any,Error> = Result.success(todo)
            completionHandler(result)
        }
        
        dataTask.resume()
    }
    
    
    private func setupView() {
//        
//        myTableView.leftAnchor.constraint(equalToSystemSpacingAfter: view.leftAnchor, multiplier: 2).isActive = true
//        view.rightAnchor.constraint(equalToSystemSpacingAfter: myTableView.rightAnchor, multiplier: 2).isActive = true
//        myTableView.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 2).isActive = true
//        view.bottomAnchor.constraint(equalToSystemSpacingBelow: myTableView.bottomAnchor, multiplier: 2).isActive = true

//        myTableView.pinToSidesOfsuperView()
        
        /*
         
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
         */
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




extension WorkForInterview:  UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        70
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = myTableView.dequeueReusableCell(withIdentifier: InterviewTableViewCell.reuseIdentifier,
                                                     for: indexPath)
        myCell.textLabel?.text = "Title"
        myCell.detailTextLabel?.text = "detailedTextLabel"
        let image = UIImage(systemName: "square.and.arrow.up.on.square.fill")
        myCell.imageView?.image = image
        return myCell
    }
    
    
}
