//
//  CurencyTip.swift
//  LOTRConverter
//
//  Created by Nitin ‘s on 09/12/24.
//

import TipKit


struct CurrencyTip:Tip {
    var title = Text("Change Currency")
    
    var message: Text? = Text("You can tap left or right cursor to change currency.")
    
    var image : Image? = Image(systemName: "hand.tap.fill")
}
