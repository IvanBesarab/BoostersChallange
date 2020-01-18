//
//  BaseViewController.swift
//  Wealth Gap
//
//  Created by Ivan Besarab on 9/29/19.
//  Copyright © 2019 Ivan Besarab. All rights reserved.
//

import UIKit

class BaseViewController<ViewModel>: UIViewController where ViewModel: BaseViewModel {
    // MARK: - Base View Controller don't use directly

    let viewModel: ViewModel

    // MARK: - Private variables

    init(withViewModel viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        print("Init of \(type(of: self))")
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        localizeView()
        bindViewModel(with: viewModel)
        viewModel.viewDidLoad()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
    }

    func localizeView() {}

    func bindViewModel(with _: ViewModel) {}

    func setupNavigationBarVisibility(isHidden: Bool) {
        navigationController?.isNavigationBarHidden = isHidden
        tabBarController?.navigationController?.isNavigationBarHidden = isHidden
    }

    deinit {
        print("Deinit of \(type(of: self))")
    }
}
