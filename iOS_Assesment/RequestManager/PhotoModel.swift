//
//  PhotoModel.swift
//  iOS_Assesment
//
//  Created by Angelos Staboulis on 29/7/23.
//

import Foundation
struct PhotoModel:Identifiable,Hashable{
    var id : String
    var author : String
    var download_url : String
    var width : Int
    var height : Int
    var url : String
}
