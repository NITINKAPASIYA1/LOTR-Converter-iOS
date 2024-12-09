//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Nitin ‘s on 05/12/24.
//

import SwiftUI
import TipKit


struct ContentView: View {
    @State var showExchangeInfo = false
    @State var leftAmount = ""
    @State var rightAmount = ""
    @State var showSelectCurrency = false
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftCurrency : Currency = .silverPiece
    @State var rightCurrency : Currency = .goldPiece
    
    let currencyTip = CurrencyTip()
    
    var body: some View {
        ZStack{
            //background image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack{
                //prancing pony imgage
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                //currency exchange text
                Text("Currency Exchange")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                
                //conversion section
                HStack{
                    //left conversion section
                    VStack{
                        HStack{
                            //currecny image
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            //currency text
                            Text(leftCurrency.name)
                                .foregroundStyle(.white)
                                .font(.headline)
                        }
                        .padding(.bottom,-5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        
                        .popoverTip(currencyTip,arrowEdge: .bottom)
                        //text field
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .padding(.leading)
                            .focused($leftTyping)
                    }
                    //equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    //right conversion section
                    VStack{
                        HStack{
                            //currency text
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            //currecny image
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom,-5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        
                        //text field
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .padding(.trailing)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                            .keyboardType(.decimalPad)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(Capsule())
                
                
                Spacer()
                //info button
                
                HStack {
                    Spacer()
                    
                    Button{
                        showExchangeInfo.toggle()
                    }
                    label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                }
            }
        }
        .task {
            try? Tips.configure()
        }
        
        .onChange(of: leftAmount) {
            if leftTyping{
                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }
        }
        .onChange(of: rightAmount) {
            if rightTyping {
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
        }
        .onChange(of:leftCurrency){
            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
        }
        .onChange(of: rightCurrency){
            rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
        }
        .sheet(isPresented: $showExchangeInfo) {
            ExchangeInfo()
        }
        .sheet(isPresented: $showSelectCurrency) {
            SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
        }
    }
}

#Preview {
    ContentView()
}
