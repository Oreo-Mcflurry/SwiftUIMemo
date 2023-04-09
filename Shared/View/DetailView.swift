//
//  DetailView.swift
//  SwiftUIMemo
//
//  Created by 유인호 on 2023/04/09.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var memo: Memo
    @State private var showComposer = false
    @EnvironmentObject var store: MemoStore
    var body: some View {
        VStack{
            ScrollView{
                VStack{
                    HStack {
                        Text(memo.content)
                            .padding()
                        Spacer(minLength: 0)
                    }
                    
                    Text(memo.insertDate, style: .date)
                        .padding()
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationTitle("메모 보기")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .principal) {
                Button{
                    showComposer = true
                } label: {
                    Image(systemName: "square.and.pencil")
                }
            }   // ToolbarItemGroup
        }
        .sheet(isPresented: $showComposer) {
            ComeposeView(memo: memo)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DetailView(memo: Memo(content: "Hello"))
                .environmentObject(MemoStore())
        }
    }
}
