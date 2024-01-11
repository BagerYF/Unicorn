    //
    //  Notifications.swift
    //  Unicorn
    //
    //  Created by Bager on 2024/1/5.
    //

import SwiftUI

struct Notifications: View {

    @State private var isOn = true

    var body: some View {
        content
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.inline)
            .navBackButton()
            .toolbar(.hidden, for: .tabBar)
    }

    var content: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Receive push notifications from us to get latest offers and promotion.")
                .modifier(TextBlack16())
            VStack(spacing: 0) {
                HStack {
                    Text("Push Notifications")
                        .modifier(TextBlack16())
                    Spacer()
                    Toggle("", isOn: $isOn)
                        .tint(.black)
                        .onChange(of: isOn) {
                            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                        }
                }
                .frame(height: 50)
                Divider()
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }}

#Preview {
    Notifications()
}
