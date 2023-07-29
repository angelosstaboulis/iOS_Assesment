//
//  ContentView.swift
//  iOS_Assesment
//
//  Created by Angelos Staboulis on 29/7/23.
//
import Foundation
import Network
import SwiftUI
import SDWebImageSwiftUI
struct ContentView: View {
    @State var photos:[PhotoModel] = []
    var body: some View {
        NavigationView{
            List(photos,id:\.self){ item in
                NavigationLink {
                    WebImage(url: URL(string: item.download_url)).resizable().frame(width: 150, height: 150, alignment: .center)
                } label: {
                    let itemID = Int(item.id)
                    if itemID! % 5 == 0 {
                        Image(uiImage: UIImage(named: "ads")!).resizable().frame(width: 150, height: 150, alignment: .center)
                    }else{
                        CellRow(row: item)
                    }
                   
                }
  
            }.onAppear {
                Task.init{
                    if await Helper.shared.checkInternetConnection() {
                        photos = await PhotoViewModel.shared.fethPhotos()
                    }else{
                        debugPrint("connection is off")
                    }
                }
            }.navigationBarTitle("iOS_Assesment", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
