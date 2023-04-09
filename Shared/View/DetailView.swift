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
    @State private var showDeleteAlert = false
    @EnvironmentObject var store: MemoStore
    @Environment(\.dismiss) var dismiss
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
                HStack{
                    Button{     //삭제
                        showDeleteAlert = true
                    } label: {
                        Image(systemName: "trash")
                    }
                    .foregroundColor(.red)
                    .alert("삭제 확인", isPresented: $showDeleteAlert) {
                        Button(role: .destructive){
                            store.delete(memo: memo)
                            dismiss()
                        } label: {
                            Text("삭제")
                        }
                    } message: {
                        Text("메모를 삭제할까요?")
                    }
                    
                    Spacer()
                    
                    Button{     // 편집
                        showComposer = true
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                    .padding()
                }   //HStack
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
