//
//  ActivityIndicatorView.swift
//  HealthJoy
//
//  Created by Daniel Espinosa on 7/23/22.
//

import SwiftUI

struct ActivityIndicatorView: View {
    
    @State private var isLoading = true

    var body: some View {
        HStack {
            Spacer()
            ActivityIndicator(isAnimating: $isLoading, style: .medium)
            Spacer()
        }
    }
}

struct ActivityIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicatorView()
    }
}
