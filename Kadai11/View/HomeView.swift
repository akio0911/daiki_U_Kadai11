//
//  HomeView.swift
//  Kadai11
//
//  Created by daiki umehara on 2021/12/29.
//

import SwiftUI
import Combine

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        HStack(alignment: .top, spacing: 30) {
            Text("都道府県")
            Text(self.viewModel.prefecture)

            Button {
                self.viewModel.didTapSelectButton()
            } label: {
                Text("選択")
            }
        }
        .fullScreenCover(isPresented: self.$viewModel.prefectureDisplayManager.isShow) {
            self.viewModel.router.presentPrefectureList()
        }

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(router: HomeRouter()))
    }
}
