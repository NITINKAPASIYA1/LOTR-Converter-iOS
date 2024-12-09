//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Nitin ‘s on 07/12/24.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var topCurrency:Currency
    @Binding var bottomCurrency:Currency
    
    var body: some View {
        ZStack{
            
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            //parchment image
            VStack{
                //text
                Text("Select the currency you are started with:")
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                
                //currency icon
                
                iconGrid(currency: $topCurrency)
                    .padding()
                
                //text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                
                //currency icons
                iconGrid(currency: $bottomCurrency)
                    .padding()
                
                //done Button
                Button("Done") {
                    dismiss()
                }.buttonStyle(.borderedProminent)
                    .tint(.brown.mix(with: .black, by: 0.2))
                    .font(.largeTitle)
                    .padding()
                    .foregroundStyle(.white)
                
            }
            .padding()
            .multilineTextAlignment(.center)
            .foregroundStyle(.black)
            
        }
    }
}

#Preview {
    @Previewable @State var topCurrency : Currency = .silverPenny
    @Previewable @State var bottomCurrency : Currency = .goldPenny
     
    SelectCurrency(topCurrency: $topCurrency, bottomCurrency: $bottomCurrency)
}
