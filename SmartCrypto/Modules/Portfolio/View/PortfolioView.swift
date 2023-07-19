//
//  PortfolioView.swift
//  SmartCrypto
//
//  Created by abhishek on 18/07/23.
//

import SwiftUI

struct PortfolioView: View {
    
    //MARK: - Properties
    @EnvironmentObject var viewModel : HomeViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedCoin : CoinModel? = nil
    @State private var quantityText : String = ""
    @State private var showCheckmark : Bool = false
    
    //MARK: - View Builder
    var body: some View {
        NavigationView(content: {
            ScrollView{
                VStack(alignment: .leading,spacing: 0, content: {
                    SearchBarView(searchText: $viewModel.searchText)
                    coinLogoViewList
                    if selectedCoin != nil {
                        VStack(spacing: 20, content: {
                            HStack(content: {
                                Text("Current Price of \(selectedCoin?.symbol.uppercased() ?? ""):")
                                Spacer()
                                Text(selectedCoin?.updateCurrentPriceToINR.asCurrencyWith6Decimals() ?? "")
                            })
                            Divider()
                            HStack {
                                Text("Amount in your portfolio:")
                                Spacer()
                                TextField("Ex : 1.4", text: $quantityText)
                                    .multilineTextAlignment(.trailing)
                                    .keyboardType(.decimalPad)
                            }
                            Divider()
                            HStack{
                                Text("Current Value :")
                                Spacer()
                                Text(getCurrentValue().asCurrencyWith2Decimals())
                            }
                        })
                        .padding()
                        .font(.headline)
                    }
                    
                })
            }
            .navigationTitle("Edit Portfolio")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XmarkButton(presentationMode: _presentationMode)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    trailingNavBarButtons
                }
            }
        })
    }
}

//MARK: - Previews
struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
            .environmentObject(preview.homeViewModel)
    }
}

//MARK: - Extension
extension PortfolioView {
    private var coinLogoViewList : some View {
        ScrollView(.horizontal,showsIndicators: false) {
            LazyHStack(spacing: 20) {
                ForEach(viewModel.allCoins){
                    coins in
                    CoinLogoView(coin: coins)
                        .frame(width: 75)
                    /// if frame is not given then bigger image will take more space and smaller
                    ///  will take less and uneven space occurs
                        .onTapGesture {
                            selectedCoin = coins
                        }
                        .padding(4)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(selectedCoin?.id == coins.id ? Color.theme.greenColor : Color.clear)
                        )
                }
            }.padding(.vertical , 4)
                .padding(.leading)
        }
    }
    
    private var trailingNavBarButtons : some View {
        HStack(spacing: 10) {
            Image(systemName: "checkmark")
                .opacity(showCheckmark ? 1.0 : 0.0)
            Button {
                saveButtonPressed()
            } label: {
                Text("Save".uppercased())
            }
            .opacity(
                (selectedCoin != nil && selectedCoin?.currentHoldings != Double(quantityText)) ? 1.0 : 0.0
            )
        }.font(.headline)
    }
    
    private func getCurrentValue() -> Double {
        
        if let quantity = Double(quantityText) {
            return quantity * (selectedCoin?.updateCurrentPriceToINR ?? 0)
        }
        return 0
    }
    
    private func saveButtonPressed(){
        guard let _ = selectedCoin else { return }
        
        // TODO : Save User Data...
        
        // show checkmark
        withAnimation(.easeIn) {
            showCheckmark = true
            removeSelection()
        }
        
        // hide keyboard
        UIApplication.shared.endEditing()
        
        // hide checkmark
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            showCheckmark = false
        }
    }
    
    private func removeSelection(){
        selectedCoin = nil
        viewModel.searchText = ""
    }
}
