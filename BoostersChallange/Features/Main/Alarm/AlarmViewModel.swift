//
//  AlarmViewModel.swift
//  BoostersChallange
//
//  Created by Ivan Besarab on 1/18/20.
//  Copyright © 2020 Ivan Besarab. All rights reserved.
//

import Foundation

final class AlarmViewModel: BaseViewModel {
//    let items = BehaviorRelay<[[ActivityRenderable]]>(value: [])
//    var headers = [Localizable.pendingActivityListTitle, Localizable.last30daysActivityListTitle]

    // MARK: - Variables

//    private weak var connector: ActivityListConnectable?

    // MARK: - Constants

//    private let userDataSource: UserDataSource

    // MARK: - VM's life cycle

//    init(connector: ActivityListConnectable?, userDataSource: UserDataSource) {
//        self.connector = connector
//        self.userDataSource = userDataSource
//    }

    // MARK: - Main

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        userDataSource.getActivity().subscribe(onSuccess: { items in
//            if let realItems = items {
//                var result = [[ActivityRenderable]]()
//                var headersResult = [String]()
//                let pendingItems = realItems.filter { $0.status == .inProgress }
//                if pendingItems.count > 0 {
//                    headersResult.append(Localizable.pendingActivityListTitle)
//                    result.append(pendingItems)
//                }
//
//                let nonPendingItems = realItems.filter { $0.status != .inProgress }
//                if nonPendingItems.count > 0 {
//                    headersResult.append(Localizable.last30daysActivityListTitle)
//                    result.append(nonPendingItems)
//                }
//                self.items.accept(result)
//            }
//        }, onError: { error in
//            self.connector?.presentErrorMessageAlert(error: error)
//        })
//            .disposed(by: disposeBag)
//    }
//
//    func presentItem(index: IndexPath) {
//        connector?.presentDetailActivity(activityItem: items.value[index.section][index.row])
//    }
}
