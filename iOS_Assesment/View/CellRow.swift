//
//  CellRow.swift
//  iOS_Assesment
//
//  Created by Angelos Staboulis on 29/7/23.
//

import SwiftUI
import SDWebImageSwiftUI
struct CellRow: View {
    @State var row:PhotoModel
    var body: some View {
        HStack{
            WebImage(url: URL(string: row.download_url)).resizable().frame(width: 150, height: 150, alignment: .center)
            Text(row.author)
        }
    }
}

struct CellRow_Previews: PreviewProvider {
    static var previews: some View {
        CellRow(row: .init(id: "", author: "", download_url: "", width: 0, height: 0, url: ""))
    }
}
