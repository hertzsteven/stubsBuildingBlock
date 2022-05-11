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

final class Stub6ViewController: UIViewController {
    
    let timerLabel: UILabel = {
                    let label = UILabel()
                    label.translatesAutoresizingMaskIntoConstraints = false
                    label.textAlignment = .center
                    label.font = UIFont.preferredFont(forTextStyle: .body)
                    label.adjustsFontForContentSizeCategory = true
                    label.numberOfLines = 0
                    label.text = "timerlabel"
                    return label
                }()
    var timing: Timer?
        // define var
         var hasDuplicate = true

    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
//        testDefer()
//        testInDispatc()
        setupView()
    }
    
    private func setupView() {
        
            // 1. create a button
        let button1 = UIButton(configuration: UIButton.Configuration.filled(),
                               primaryAction: UIAction(title: "do a Serial QueUe") { action in
            print(action.title)
//            self.askForData()
            self.doconcurrentQueues()
//            self.doSync()
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
                               primaryAction: UIAction(title: "do async 2 process") { action in
            print(action.title)
            self.doaSyncTwoQues()
        }
        )
        
            // 4. pass it to the stackView
        setupStackView(button1, label, button2, timerLabel)
        
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
    
    func doSync()  {
        print("Start - Before Dispatch-sync-Queue")
        DispatchQueue.global().sync {
            [1,2,3,4,5,6,7,8,9].forEach { item in
                print("Standard sync \(item)")
            }
            [1,2,3,4,5,6,7,8,9].reversed().forEach { item in
                print("Standard sync \(item)")
            }

        }
        print("Done - After Dispatch-sync-Queue")
    }
    
    
    func doaSync()  {
        print("Start - Before Dispatch-async-Queue")
        DispatchQueue.global().async {
            [1,2,3,4,5,6,7,8,9].forEach { item in
                print("Standard async \(item)")
            }
            [1,2,3,4,5,6,7,8,9].reversed().forEach { item in
                print("Standard async \(item)")
            }

        }
        print("Done - After Dispatch-saync-Queue")
    }
  
    
    func doaSyncTwoQues()  {
        print("Start - Before Dispatch-async-Queue")
        DispatchQueue.global().async {
            [1,2,3,4,5,6,7,8,9].forEach { item in
                print("Standard async 1 \(item)")
            }
            [1,2,3,4,5,6,7,8,9].reversed().forEach { item in
                print("Standard async 1 \(item)")
            }
        }
        DispatchQueue.global().async {
            [1,2,3,4,5,6,7,8,9].forEach { item in
                print("Standard async 2 \(item)")
            }
            [1,2,3,4,5,6,7,8,9].reversed().forEach { item in
                print("Standard async 2 \(item)")
            }
        }
        print("Done - After Dispatch-saync-Queue")
    }
    
    func testDefer()  {
        print("Starting func")
        do {
            defer {
                print("did do defer")
            }
            
            for x in 1...5 {
                print(" do item \(x)")
            }
        }
        defer {
             print("did the defer")
         }

        for x in 1...5 {
            print(x)
        }
//        print("in loop ")
        print("ending func")
    }
    
    func testInDispatc() {
        print("before the queue")
        sleep(5)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            defer {
                print("from defer of the queue")
            }
            print("did the work in the queue")
        }
        print("after the queue")
    }
}

extension Stub6ViewController {
    func startTimer() {
        var counter = 0
//        {
//            willSet
//            {
//                if counter == 4 {
//                    timing?.invalidate()
//                    print("timer stopped")
//                }
//            }
//        }
        timing = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [ weak self] timer in
            let df = DateFormatter()
            df.timeStyle = .long
            let formattedDateTime = df.string(from: Date())
            self?.timerLabel.text = formattedDateTime
            counter += 1
             }
        }
    
      
    func askForData()  {
        let group = DispatchGroup()

        // start the task in the dispatch group
        group.enter()
        processURLRequest { hasDuplicate in
            self.hasDuplicate = hasDuplicate
            // leave the dispatch group when the aync task comletes
            group.leave()
        }
        DispatchQueue.global(qos: .utility).async {
            group.wait() // synchronous wait
            
            group.enter()
            
            self.processURLRequest { hasDuplicate in
                self.hasDuplicate = hasDuplicate
                // leave the dispatch group when the aync task comletes
                group.leave()
            }
            group.wait() // synchronous wait

            print("from wait - Stopping Timer")
            self.timing?.invalidate()

        }
        print("continuing after dispatch group wait")
//        group.wait() // synchronous wait
//        print("from wait - Stopping Timer")
//        timing?.invalidate()

            //    group.notify(queue: DispatchQueue.global(qos: .background), execute: {
            //        print("from notify - Stopping Timer")
            //        self.timing?.invalidate()
            //    })
        
    }


func processURLRequest(_ completionHandler: @escaping (Bool) -> Void )  {
 
    print("from processURLRequest - Doing URL Request")
    guard let url: URL = URL(string: "https://reqres.in/api/users?delay=5") else { fatalError("did not work") }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        print(data)
        print("from processURLRequest - Finished URL Request")
        let hasDuplicate = false
        completionHandler(hasDuplicate)
    }.resume()
    
}
    
    func doconcurrentQueues()  {
        DispatchQueue(label: "concurrentQueue", attributes: .concurrent).async {
            for i in 1...5 {
                print ("01 First concurrent async task \(i)")
            }
            for i in 1...5 {
                 print ("01 Second concurrent async task \(i)")
             }

        }
        DispatchQueue(label: "concurrentQueue", attributes: .concurrent).async {
            for i in 1...5 {
                print ("02 First concurrent async task \(i)")
            }
            for i in 1...5 {
                 print ("02 Second concurrent async task \(i)")
             }

        }


    }

}
