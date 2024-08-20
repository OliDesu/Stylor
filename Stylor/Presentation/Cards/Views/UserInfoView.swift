//
//  UserInfoView.swift
//  Stylor
//
//  Created by Ali El Mufti on 06/07/2024.
//

import SwiftUI

struct UserInfoView: View {
    var body: some View {
        VStack (alignment: .leading){
            HStack {
                Text("Lionel")
                    .font(.title)
                    .fontWeight(.heavy)
                
                Text("36")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.semibold)
                Spacer()
                Button {
                print("DEBUG Show Profile Here..")
                    
                } label: {
                    Image(systemName: "arrow.up.circle")
                        .fontWeight(.bold)
                        .imageScale(.large)
                }
            }
            Text("Footballer | GOAT")
                .font(.subheadline)
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
        }
        .foregroundStyle(.white)
            .padding()
            .background(
                LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom))
    }
}

#Preview {
    UserInfoView()
}
