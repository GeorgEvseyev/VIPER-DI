//
//  MainAssembly.swift
//  VIPER + DI
//
//  Created by Георгий Евсеев on 7.05.24.
//

import UIKit

class MainAssembly {
    func assemble() -> UIViewController {
        let networkManager = NetworkManager()
        let router = MainRouter()
        let interactor = MainInteractor()
        let presenter = MainPresenter()
        let controller = MainViewController(presenter: presenter)
        interactor.presenter = presenter
        interactor.networkManager = networkManager
        presenter.view = controller
        presenter.interactor = interactor
        presenter.router = router
        return controller
    }
}
