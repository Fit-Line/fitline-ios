//
//  AgreeTerm.swift
//  fitline-ios
//
//  Created by 준기 on 6/4/24.
//

import SwiftUI


struct AgreeTerm: View {
    var body: some View {
        Header(title: "약관 동의")
        NextButton(destination: NextPageView())
        
    }
}

#Preview {
    AgreeTerm()
}
