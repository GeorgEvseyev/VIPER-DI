//
//  Presenter.swift
//  VIPER + DI
//
//  Created by Георгий Евсеев on 3.05.24.
//

import UIKit

protocol IMainPresenter: AnyObject {
    func parse(data: Data)
    func buttonPressed()
}

final class MainPresenter {
    private let router: IMainRouter?
    weak var view: IMainViewController?
    var networkManager: INetworkManager?
    init(router: IMainRouter, networkManager: INetworkManager) {
        self.router = router
        self.networkManager = networkManager
    }
}

extension MainPresenter: IMainPresenter {
    func parse(data: Data) {
        if let json = try? JSONSerialization.jsonObject(with: data) as? [Any] {
            view?.setLabelText("json: \(json)")
        }
    }

    func buttonPressed() {
        networkManager?.sendRequest(adress: UrlString().baseUrlString, completion: { data, _ in
            if let data = data {
                self.parse(data: data)
            }
        })
    }
}
