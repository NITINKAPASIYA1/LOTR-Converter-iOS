//
//  ExchangeInfo.swift
//  LOTRConverter
//
//  Created by Nitin ‘s on 06/12/24.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            Image(.parchment).resizable().ignoresSafeArea().background(.brown)
            VStack{
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .fontWeight(.regular)
                    .tracking(3)
                   
                Text("Here at the PrancingPonny,we are happy to help you exchange your LOTR coins for other currencies.We used to take brandy Buckes for the exchange rates from one currency to another currency so make sure about this in your mind before going further as on that day we were not able to exchange any currency.")
                    .padding()
                    .font(.title3)
                    .fontWeight(.regular)
                
                ExchangeRate(leftImage: .goldpiece, text: "1 Gold Piece = 4 Gold Pennies", rightImage: .goldpenny)
                ExchangeRate(leftImage: .goldpenny, text: "1 Gold Penny = 4 Silver Pennies", rightImage: .silverpenny)
                ExchangeRate(leftImage: .silverpiece, text: "1 Silver Piece = 4 Silver Pennies", rightImage: .silverpenny)
                ExchangeRate(leftImage: .silverpenny, text: "1 Silver Penny = 100 Copper Penny", rightImage: .copperpenny)
               
                Button("Done") {
                    dismiss()
                }.buttonStyle(.borderedProminent)
                    .tint(.brown.mix(with: .black, by: 0.2))
                    .font(.largeTitle)
                    .padding()
                    .foregroundStyle(.white)
                    
            }
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    ExchangeInfo()
}

