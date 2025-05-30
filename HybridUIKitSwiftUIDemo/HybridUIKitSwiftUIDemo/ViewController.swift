//
//  ViewController.swift
//  HybridUIKitSwiftUIDemo
//
//  Created by Himali Marasinghe on 2025-05-29.
//

import UIKit
import SwiftUI
import Combine

class ViewController: UIViewController {
    private var cancellables = Set<AnyCancellable>()
    private let viewModel: CounterViewModel
    private let label = UILabel()

    init(viewModel: CounterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        label.text = "UIKit Count: 0"
        label.font = .systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false

        let swiftUIButton = UIButton(type: .system)
        swiftUIButton.setTitle("Open SwiftUI Screen", for: .normal)
        swiftUIButton.addTarget(self, action: #selector(openSwiftUIScreen), for: .touchUpInside)
        swiftUIButton.translatesAutoresizingMaskIntoConstraints = false

        let incrementButton = UIButton(type: .system)
        incrementButton.setTitle("Add 1 (UIKit)", for: .normal)
        incrementButton.addTarget(self, action: #selector(incrementTapped), for: .touchUpInside)
        incrementButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(label)
        view.addSubview(swiftUIButton)
        view.addSubview(incrementButton)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
            swiftUIButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            swiftUIButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            incrementButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            incrementButton.topAnchor.constraint(equalTo: swiftUIButton.bottomAnchor, constant: 20)
        ])

        viewModel.$count
            .receive(on: RunLoop.main)
            .sink { [weak self] count in
                self?.label.text = "UIKit Count: \(count)"
            }
            .store(in: &cancellables)
    }

    @objc func openSwiftUIScreen() {
        let swiftUIView = CounterView(viewModel: viewModel)
        let hostingVC = UIHostingController(rootView: swiftUIView)
        self.navigationController?.pushViewController(hostingVC, animated: true)
    }

    @objc func incrementTapped() {
        viewModel.increment()
    }
}


