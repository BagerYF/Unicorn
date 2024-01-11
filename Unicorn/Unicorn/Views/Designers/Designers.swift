    //
    //  Designers.swift
    //  Unicorn
    //
    //  Created by Bager on 2023/12/13.
    //

import SwiftUI

struct Designers: View {

    @State private var path = NavigationPath()

    @ObservedObject
    var vm = DesignerVM()

    var body: some View {
        NavigationStack(path: $path) {
            content
                .navigationTitle("Designers")
                .navigationBarTitleDisplayMode(.inline)
                .modifier(SetNavCartButton(path: $path))
                .navigationDestination(for: RouterModel.self) { route in
                    route.destination.view($path, params: route.params)
                }
        }
    }

    var content: some View {
        VStack {
            List() {
                Section {
                    VStack(spacing: 0) {
                        HStack {
                            Text("Designer A-Z")
                                .modifier(TextBlack16())
                            Spacer()
                            Image("arrow")
                        }
                        .frame(height: 44)
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                        .contentShape(Rectangle())
                        .onTapGesture {
                            path.append(RouterModel(destination: .designerList))
                        }
                        Divider()
                    }
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .listRowSeparator(.hidden)
                }
                Section() {
                    ForEach(vm.designerList, id: \.id) { designer in
                        VStack(spacing: 0) {
                            HStack {
                                Text(designer.name)
                                    .modifier(TextBlack16())
                                Spacer()
                                Image("arrow")
                            }
                            .frame(height: 44)
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                            Divider()
                        }
                        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            path.append(RouterModel(destination: .productList))
                        }
                    }
                } header: {
                    Text("Featured Designers")
                        .modifier(TextBlack14())
                        .listRowSeparator(.hidden)
                        .listRowInsets(.init(top: 0, leading: 16, bottom: 0, trailing: 0))
                }
            }
            .background(.white)
            .scrollContentBackground(.hidden)
            .listStyle(.plain)
            .environment(\.defaultMinListRowHeight, 30)
        }
    }
}

#Preview {
    Designers()
}
