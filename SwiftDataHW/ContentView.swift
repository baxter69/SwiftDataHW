//
//  ContentView.swift
//  SwiftDataHW
//
//  Created by Владимир on 11.01.2026.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \TestData.timestamp, order: .reverse) private var testData: [TestData]
    
    @State private var newMessage = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                // Список сохранённых данных
                List(testData) { item in
                    HStack {
                        Text(item.text)
                            .font(.body)
                        Spacer()
                        Text(item.timestamp, style: .relative)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            modelContext.delete(item)
                        } label: {
                            Label("Удалить", systemImage: "trash")
                        }
                    }
                }
                
                HStack {
                    TextField("Введите тестовые данные", text: $newMessage)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button("Сохранить") {
                        saveNewData()
                    }
                    .disabled(newMessage.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
                .padding()
            }
            .navigationTitle("Оффлайн-режим")
            .onAppear {
                print("Загружено \(testData.count) записей из SwiftData")
            }
        }
    }
    
    private func saveNewData() {
        let newItem = TestData(text: newMessage)
        modelContext.insert(newItem)
        newMessage = ""
        print("Сохранено: \(newItem.text)")
    }
}
