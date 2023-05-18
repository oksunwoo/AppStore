//
//  DetailViewController.swift
//  AppStore
//
//  Created by Sunwoo on 2023/05/16.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        test()
        // Do any additional setup after loading the view.
    }
    
    func test() {
        let testview = SummaryScrollView()
        view.backgroundColor = .white
        view.addSubview(testview)
        NSLayoutConstraint.activate([
            testview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            testview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            testview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            testview.heightAnchor.constraint(equalToConstant: CGFloat(100))
            
        
        ])
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
