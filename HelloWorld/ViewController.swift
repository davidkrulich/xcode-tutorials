//
//  ViewController.swift
//  HelloWorld
//
//  Created by David Krulich on 03/08/2019.
//  Copyright © 2019 David Krulich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Hello World")
        
        label.accessibilityIdentifier = "TestLabel"
        // Comment
        let viewController = FooViewController(viewModel: DefaultFooViewModel())
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true, completion: nil)
        
//        let test = TestMemberwiseGenerating(foo: "foo 123", bar: 321)
//        print(test.bar12)
//
//        for row in 0..<20 {
//            print("Row: \(row)")
//        }
//
//        let number: Int? = "132".parseInt()
//        print(number ?? 2)
    }
}
