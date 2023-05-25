//
//  LocationSearchResultCell.swift
//  UberApp
//
//  Created by Kevin Hernandez on 19/05/23.
//
 
import SwiftUI

struct LocationSearchResultCell: View {
    let title: String
    let subtitle: String
    @Environment(\.colorScheme) var colorSheme
    var body: some View {
        HStack {
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundColor(.blue)
                .accentColor(.white)
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.body)
                    .foregroundColor(colorSheme == .dark ? .gray : .black)
                
                Text(subtitle)
                    .font(.system(size: 15))
                    .foregroundColor(colorSheme == .dark ? Color(.systemGray3) : .gray)
                
                Divider()
                    .padding(.trailing)
            }
            .padding(.leading, 8)
            .padding(.vertical)
        }
        .padding(.leading)
    }
}

struct LocationSearchResultCell_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchResultCell(title: "Starbucks", subtitle: "123 st")
    }
}
