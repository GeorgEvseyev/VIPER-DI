//
//  MainInteractor.swift
//  VIPER + DI
//
//  Created by Георгий Евсеев on 14.05.24.
//

import UIKit

protocol IMainInteractor: AnyObject {
    func request()
}

class MainInteractor {
    var networkManager: INetworkManager?
    
    weak var presenter: IMainPresenter?
}

extension MainInteractor: IMainInteractor {
    func request() {
        networkManager?.loadData(adress: UrlString().baseUrlString) { data, error in
            if let data = data {
                self.presenter?.parse(data: data)
                print(data)
            }
        }
        return
    }
}
