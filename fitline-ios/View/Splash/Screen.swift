//
//  Screen.swift
//  fitline-ios
//
//  Created by 준기 on 4/29/24.
//

import SwiftUI

struct Screen: View {
    @State private var isActive = false
    
    var body: some View {
        VStack {
            VStack{
                HStack{
                    Image("Logo")
                        .resizable()
                        .frame(width: 60,height: 60)
                    
                }
                
            }
        }
    }
}

#Preview {
    Screen()
}
