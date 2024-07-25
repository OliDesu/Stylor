//
//  PortfolioView.swift
//  Stylor
//
//  Created by Ali El Mufti on 25/07/2024.
//

import SwiftUI

struct PortfolioView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Your space")
                    .font(.system(.largeTitle, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .clipped()
                    .padding(.leading)
                    .padding(.bottom, 8)
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 4), GridItem(.flexible(), spacing: 4)], spacing: 4) {
                    ForEach(0..<5) { _ in // Replace with your data model here
                        Image("myImage")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                            .aspectRatio(1/1, contentMode: .fit)
                            .clipped()
                            .mask { RoundedRectangle(cornerRadius: 30, style: .continuous) }
                    }
                }
                .padding(.horizontal)
            }
            .frame(maxWidth: .infinity)
            .clipped()
            .padding(.top, 98)
            .padding(.bottom, 150)
        }
        .overlay(alignment: .top) {
            // Status Bar
            HStack {
                Text("9:41")
                    .frame(width: 109)
                    .clipped()
                    .font(.system(.body, weight: .semibold))
                Spacer()
                HStack(spacing: 5) {
                    Image(systemName: "cellularbars")
                        .imageScale(.small)
                    Image(systemName: "wifi")
                        .imageScale(.small)
                    Image(systemName: "battery.100")
                        .symbolRenderingMode(.hierarchical)
                        .font(.system(.body, weight: .light))
                }
                .frame(width: 109)
                .clipped()
                .font(.system(.body, weight: .semibold))
            }
            .padding(.horizontal)
            .padding(.top, 5)
            .frame(maxWidth: .infinity)
            .clipped()
            .frame(height: 53)
            .clipped()
            .background(Color(.systemBackground))
        }
        .overlay(alignment: .bottom) {
            // Tab Bar
            VStack(spacing: 0) {
                Divider()
                HStack(spacing: 10) {
                    ForEach(0..<5) { _ in // Replace with your data model here
                        VStack(spacing: 4) {
                            Image(systemName: "play.circle.fill")
                                .imageScale(.large)
                                .frame(height: 26)
                                .clipped()
                            Text("Listen Now")
                                .font(.caption2)
                        }
                        .frame(maxWidth: .infinity)
                        .clipped()
                        .frame(height: 45)
                        .clipped()
                        .foregroundStyle(.secondary)
                    }
                }
                .padding(.horizontal, 15)
                .padding(.top, 5)
            }
            .frame(height: 84, alignment: .top)
            .clipped()
            .background {
                Rectangle()
                    .fill(.clear)
                    .background(Material.bar)
            }
        }    }
}

#Preview {
    PortfolioView()
}
