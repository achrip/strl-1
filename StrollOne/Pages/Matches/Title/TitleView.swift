//
//  TitleView.swift
//  StrollOne
//
//  Created by Ashraf Alif Adillah on 27/09/25.
//

import Foundation
import SwiftUI

struct TitleView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("Your Turn")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("7")
                        .font(.caption2)
                        .fontWeight(.bold)
                        .frame(width: 16, height: 16)
                        .foregroundStyle(Color.black)
                        .background(Color("Primary"))
                        .clipShape(Circle())
                        .padding(.leading, 5)
                }
                Text("Make your move, they are waiting 🎵")
                    .font(.caption)
                    .foregroundStyle(Color("Secondary"))
                    .fontWeight(.light)
                    .italic()
            }
            
           Spacer()
            
           Image(systemName: "person.circle")
        }
        .padding()
    }
}

#Preview {
    TitleView()
}
