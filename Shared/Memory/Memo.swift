//
//  Memo.swift
//  SwiftUIMemo
//
//  Created by 유인호 on 2023/04/09.
//

import Foundation
import SwiftUI

class Memo: Identifiable, ObservableObject { // 데이터를 리스트에 쉽게 바인딩 , 메모를 편집할때 필요
    let id : UUID
    @Published var content: String
    let insertDate : Date
    
    init(content: String, insertDate: Date = Date.now){
        id = UUID()
        self.content = content
        self.insertDate = insertDate
    }
}
