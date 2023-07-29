//
//  FetchRequest.swift
//  iOS_Assesment
//
//  Created by Angelos Staboulis on 29/7/23.
//

import Foundation
import Alamofire
import SwiftyJSON
class FetchRequest{
    func fethPhotos() async -> [PhotoModel]{
        return await withUnsafeContinuation { continuation in
            let url = URL(string: "https://picsum.photos/v2/list")
            let request = URLRequest(url: url!)
            AF.request(request as URLRequestConvertible).responseData { dataResponse in
                do{
                                let json = try JSON(data: dataResponse.data!)
                                var photosArray:[PhotoModel] = []
                                for item in 0..<json.count{
                                    let photos = PhotoModel(id: json[item]["id"].string!, author: json[item]["author"].string!, download_url: json[item]["download_url"].string!, width: json[item]["width"].int!, height: json[item]["height"].int!, url: json[item]["url"].string!)
                                    photosArray.append(photos)
                                }
                    continuation.resume(returning: photosArray)
                }catch{
                    
                }
            }
        }

   
    }
}
