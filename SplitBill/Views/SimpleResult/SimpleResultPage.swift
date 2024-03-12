//
//  SimpleResultPage.swift
//  HiungBagiUang
//
//  Created by edo lubis on 28/02/24.
//

import SwiftUI

struct SimpleResultPage: View {
    
    @EnvironmentObject var formSimpleViewModel: FormSimpleViewModel
    @EnvironmentObject var appStateViewModel: AppStateViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ScrollView {
                    ForEach(formSimpleViewModel.results.indices, id: \.self) { index in
                        ItemResult(index: index, result: formSimpleViewModel.results[index])
                    }
                }
                PrimaryButton("Selesail", width: .infinity) {
                    appStateViewModel.onRestartApp()
                    formSimpleViewModel.resetForm()
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
            }
            
        }
            .navigationTitle("Hasil")
            .onAppear {
                formSimpleViewModel.onCalculateTheResult()
            }
    }
}

#Preview {
    SimpleResultPage()
        .environmentObject(FormSimpleViewModel())
        .environmentObject(AppStateViewModel())
}
