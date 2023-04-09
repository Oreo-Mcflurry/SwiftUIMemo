//
//  ComeposeView.swift
//  SwiftUIMemo
//
//  Created by 유인호 on 2023/04/09.
//

import SwiftUI

struct ComeposeView: View {
    @EnvironmentObject var store: MemoStore
    @Environment(\.dismiss) var dismiss
    @State private var content: String = ""
    
    var memo: Memo? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $content)
                    .padding()
                    .onAppear {
                        if let memo = memo {
                            content = memo.content
                        }
                    }
            }
            .navigationTitle(memo != nil ? "메모편집" : "새 메모")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("취소")
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        if let memo = memo {
                            store.update(memo: memo, content: content)
                        } else {
                            store.insert(memo: content)
                        }
                        dismiss()
                    } label: {
                        Text("저장")
                    }
                }
                
            }
        }       // navigationView
    }
}

struct ComeposeView_Previews: PreviewProvider {
    static var previews: some View {
        ComeposeView()
            .environmentObject(MemoStore())
    }
}
