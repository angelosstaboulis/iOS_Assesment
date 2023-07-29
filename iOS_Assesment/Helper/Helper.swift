//
//  Helper.swift
//  iOS_Assesment
//
//  Created by Angelos Staboulis on 29/7/23.
//

import Foundation
import Network
class Helper{
    static let shared = Helper()
    private init(){}
    func checkInternetConnection() async->Bool{
        return await withUnsafeContinuation { continuation in
            let internet = NWPathMonitor()
            internet.start(queue: .main)
            internet.pathUpdateHandler = { [weak self] getValue in
                if getValue.status == .satisfied{
                    continuation.resume(returning: true)
                }else{
                    continuation.resume(returning: false)
                }
            }
        }
    }
    
}
