//
//  GFAlertVC.swift
//  GitHub
//
//  Created by Bruno Silva on 23/05/21.
//

import UIKit

class GFAlertVC: UIViewController {
    
    //MARK: - Constants and Variables
    let containerView       = UIView()
    let titleLabel          = GFTitleLabel(textAligment: .center, fontSize: 20)
    let messageLabel        = GFBodyLabel(textAligment: .center)
    let actionButton        = GFButton(backgroundColor: .systemPink, title: "Ok")
    let padding: CGFloat    = 20
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    //MARK: - Init
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle     = title
        self.message        = message
        self.buttonTitle    = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCyle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    //MARK: - Setup
    private func setup() {
        setupView()
        configureContainerView()
        configureTitleLabel()
        configureActionButton()
        configureBodyLabel()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
    }
    
    //MARK: - Actions
    @objc private func dismissVC() {
        dismiss(animated: true)
    }
    
    //MARK: - Constraint
    private func configureContainerView() {
        view.addSubview(containerView)
        containerView.backgroundColor       = .systemBackground
        containerView.layer.cornerRadius    = 16
        containerView.layer.borderWidth     = 2
        containerView.layer.borderColor     = UIColor.white.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 280),
            containerView.widthAnchor.constraint(equalToConstant: 280)
        ])
    }
    
    private func configureTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.text = alertTitle ?? "Something went wrong"
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    private func configureActionButton() {
        containerView.addSubview(actionButton)
        actionButton.setTitle(buttonTitle ?? "Ok", for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func configureBodyLabel() {
        containerView.addSubview(messageLabel)
        messageLabel.text           = message ?? "Unable to complete request"
        messageLabel.numberOfLines  = 4
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
        ])
    }
}
