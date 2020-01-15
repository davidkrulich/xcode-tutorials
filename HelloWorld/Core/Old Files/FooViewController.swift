//
//  FooViewController.swift
//  HelloWorld
//
//  Created by David Krulich on 26/09/2019.
//  Copyright © 2019 David Krulich. All rights reserved.
//

import UIKit

protocol FooViewModel {
    var name: String { get }
    
    func downloadData(completion: @escaping (String) -> Void)
}

class DefaultFooViewModel: FooViewModel {
    var name: String = "Test name"
    
    func downloadData(completion: @escaping (String) -> Void) {
        completion("Downloaded data")
    }
}

class DifferentLogicFooViewModel: FooViewModel {
    var name: String = "Carl Johnson"
    
    func downloadData(completion: @escaping (String) -> Void) {
        completion("Another data")
    }
}

class FooViewController: UIViewController {
    
    var viewModel: FooViewModel?
    
    init(viewModel: FooViewModel?) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.downloadData(completion: { [weak self] data in
            guard let self = self else {
                return
            }
            
            print(self.viewModel?.name ?? "no name")
            print(data)
        })
    }
}
