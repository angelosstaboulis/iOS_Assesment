//
//  PhotosViewModel.swift
//  iOS_Assesment
//
//  Created by Angelos Staboulis on 29/7/23.
//

import Foundation
class PhotoViewModel:ObservableObject{
    var apimanager:FetchRequest!
    static let shared =  PhotoViewModel()
    private init(){
        apimanager = FetchRequest.init()
    }
    func fethPhotos() async -> [PhotoModel]{
        return await withUnsafeContinuation { continuation in
            Task.init{
                let returnArray = await apimanager.fethPhotos()
                continuation.resume(returning: returnArray)
            }
        }
        
    }
}
