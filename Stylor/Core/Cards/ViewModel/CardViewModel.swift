//
//  CardViewModel.swift
//  Stylor
//
//  Created by Ali El Mufti on 16/07/2024.
//

import Foundation

class CardViewModel: ObservableObject {
    @Published var cardModels = [Card]()
    private let service: CardApiService
    
    init(
        service: CardApiService
    ){
        self.service = service
        Task {
            await fetchCardModels()
        }
    }
    func fetchCardModels() async {
        do {
            self.cardModels  = try await service.fetchCardModels()      }catch {
                print(
                    "DEBUG: Failed to fetch cards with error: \(error)"
                )
            
        }
    }
}
