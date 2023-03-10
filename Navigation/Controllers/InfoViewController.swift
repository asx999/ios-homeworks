//
//  InfoViewController.swift
//  Navigation
//
//  Created by Александр on 02.02.2023.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.4862745098, green: 0.4117647059, blue: 0.5019607843, alpha: 1)
        addViews()
        layout()
    }

    //MARK: - Add AlertButton
    private lazy var postButton: CradientButton = {
        var button = CradientButton(frame: CGRectMake(0, 0, 200, 40))
        button.setTitle("Go to alert", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        button.layer.cornerRadius = 16

        button.layer.shadowColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1).cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSizeMake(0.0, 5.0)

        button.addTarget(self, action: #selector(actionPostButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    //MARK: - Action AlertButton
    @objc private func actionPostButton() {
        let alertController = UIAlertController(title: "Уже уходите?", message: "Вы точно хотите выйти?", preferredStyle: .alert)

        let outAction = UIAlertAction(title: "Выйти", style: .default, handler: { _ in
            print("Нажал выйти")
        } )

        let cancelAction = UIAlertAction(title: "Отмена", style: .destructive) { _ in
            print("Нажал отмена")
        }

        alertController.addAction(cancelAction)
        alertController.addAction(outAction)
        present(alertController, animated: true) {
            print("Alert показывается")
        }
    }

    //MARK: - Add Views
    private func addViews() {
        view.addSubview(postButton)
    }

    //MARK: - Add Constraint
    private func layout() {
        NSLayoutConstraint.activate([

            postButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            postButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -300),
            postButton.widthAnchor.constraint(equalToConstant: 200),
            postButton.heightAnchor.constraint(equalToConstant: 40)

        ])
    }
}
