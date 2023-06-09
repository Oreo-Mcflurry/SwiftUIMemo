//
//  MainListView.swift
//  SwiftUIMemo
//
//  Created by 유인호 on 2023/04/09.
//

import SwiftUI

struct MainListView: View {
    @EnvironmentObject var store: MemoStore
    
    @State private var showComposer: Bool = false
    
    var body: some View {
        NavigationView() {
            List {
                ForEach(store.list) { memo in
                    NavigationLink {
                        DetailView(memo: memo)
                    } label: {
                        MemoCell(memo: memo)
                    }
                }
                .onDelete(perform: store.delete)
            }
            .listStyle(.plain)
            .navigationTitle("내 메모")
            .toolbar {
                Button {
                    showComposer = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showComposer) {
                ComeposeView()
            }
        .navigationViewStyle(.stack)
        }   // navigationView
    }   // body
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
            MainListView()
                .environmentObject(MemoStore())
    }
}


