//
//  ContentView.swift
//  SplitBill
//
//  Created by edo lubis on 12/03/24.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationView {
            SimplePage()
        }
        .tint(AppColor.primary)
    }
}

#Preview {
    ContentView()
}
