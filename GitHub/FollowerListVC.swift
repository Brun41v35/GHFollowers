//
//  FollowerListVC.swift
//  GitHub
//
//  Created by Bruno Silva on 22/05/21.
//

import UIKit

class FollowerListVC: UIViewController {
    
    //MARK: - Variables
    var username: String!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    //MARK: - Setup
    private func setup() {
        setupNavigationBar()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupNavigationBar() {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
