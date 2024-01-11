    //
    //  Home.swift
    //  Unicorn
    //
    //  Created by Bager on 2023/12/13.
    //

import SwiftUI
import SwiftUIPager
import Kingfisher
import NavigationTransition

struct Home: View {

    @State private var path = NavigationPath()

    @ObservedObject
    var vm = HomeVM()

    var body: some View {
        NavigationStack(path: $path) {
            content
                .navigationTitle("Shopify")
                .navigationBarTitleDisplayMode(.inline)
                .modifier(SetNavCartButton(path: $path))
                .navigationDestination(for: RouterModel.self) { route in
                    route.destination.view($path, params: route.params)
                }
        }
    }

    var content: some View {
        ScrollView {
            ForEach(vm.sectionList, id: \.id) { item in
                switch HomeSectionType(rawValue: item.name) {
                case .FirstSection:
                    normalSection(data: item, path: $path)
                case .PopularSection, .PrimarySection:
                    popularSection(data: item, path: $path)
                case .NewSeasonSection:
                    newSeasonSection(data: item, path: $path)
                case .NewArrivalSection:
                    newArrivalSection(data: item, path: $path)
                default:
                    Text("")
                }
            }
        }
    }
}

struct newArrivalSection: View {

    var data: HomeModel

    @Binding var path: NavigationPath

    @StateObject var page: Page = .first()

    var body: some View {
        VStack(spacing: 0) {
            Text(data.title ?? "")
                .modifier(TextBlack24())
                .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
            Text(data.subTitle ?? "")
                .modifier(TextBlack16())
                .multilineTextAlignment(.center)
                .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
            Pager(page: page,
                  data: Array(0..<data.items.count),
                  id: \.self,
                  content: { index in
                let item = data.items[index]

                    VStack(alignment: .center, spacing: 0) {
                        KFImage(URL(string: item.absoluteMobileImageUrl ?? AppConstants.BigImagePlaceHolder))
                            .resizable()
                            .frame(width: 305, height: 374)
                            .background(.white)
                    }
                    .frame(width: 305, height: 500)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding(EdgeInsets(top: 0, leading: -28, bottom: 0, trailing: 0))
                    .onTapGesture {
                        path.append(RouterModel(destination: .productList))
                    }
            })
            .singlePagination(ratio: 0.1)
            .preferredItemSize(CGSize(width: 305, height: 500))
            .itemSpacing(16)
            .frame(height: 500)
        }
            //            CustomPageControl(numberOfPages: data.items.count, currentPage: $currentPage)
    }
}

struct newSeasonSection: View {

    var data: HomeModel

    @Binding var path: NavigationPath

    @StateObject var page: Page = .first()

    var body: some View {
        VStack(spacing: 0) {
            Text(data.title ?? "")
                .modifier(TextBlack24())
                .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
            Text(data.subTitle ?? "")
                .modifier(TextBlack16())
                .multilineTextAlignment(.center)
                .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
            Pager(page: page,
                  data: Array(0..<data.items.count),
                  id: \.self,
                  content: { index in
                let item = data.items[index]
                    VStack(alignment: .center, spacing: 0) {
                        KFImage(URL(string: item.absoluteMobileImageUrl ?? AppConstants.BigImagePlaceHolder))
                            .resizable()
                            .frame(width: 305, height: 374)
                            .background(.cyan)
                        Text(item.text ?? "")
                            .modifier(TextBlack16())
                            .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
                    }
                    .frame(width: 305, height: 500)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding(EdgeInsets(top: 0, leading: -28, bottom: 0, trailing: 0))
                    .onTapGesture {
                        path.append(RouterModel(destination: .productList))
                    }
            })
            .singlePagination(ratio: 0.1)
            .preferredItemSize(CGSize(width: 305, height: 500))
            .itemSpacing(16)
            .frame(height: 500)

            Button(action: {}, label: {
                Text("Shop now")
                    .padding(.horizontal, kScreenWidth / 2.0 - 16 - 40)
                    .padding(.vertical, 14)
                    .background(.black)
                    .foregroundColor(.white)
                    .cornerRadius(4)
            })
            .buttonStyle(PlainButtonStyle())
        }
            //            CustomPageControl(numberOfPages: data.items.count, currentPage: $currentPage)
    }
}


struct popularSection: View {

    var data: HomeModel

    @Binding var path: NavigationPath

    @StateObject var page: Page = .first()

    var body: some View {
        VStack(spacing: 0){
            ForEach(data.items) { item in

                    VStack(alignment: .leading, spacing: 0) {
                        KFImage(URL(string: item.absoluteMobileImageUrl ?? AppConstants.BigImagePlaceHolder))
                            .resizable()
                            .frame(height: 280)
                            .background(.cyan)
                        Text(item.brand ?? "")
                            .modifier(TextBlack24())
                            .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
                        Text(item.productName ?? "")
                            .modifier(TextBlack16())
                            .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
                        Text("Shop now")
                            .modifier(TextBlack14())
                            .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
                            .underline()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                    .onTapGesture {
                        path.append(RouterModel(destination: .productList))
                    }

            }
        }
    }
}

struct normalSection: View {

    var data: HomeModel

    @Binding var path: NavigationPath

    @StateObject var page: Page = .first()

    var body: some View {
        Pager(page: page,
              data: Array(0..<data.items.count),
              id: \.self,
              content: { index in
            let item = data.items[index]
            VStack(alignment: .leading, spacing: 0) {
                KFImage(URL(string: item.absoluteMobileImageUrl ?? AppConstants.BigImagePlaceHolder))
                    .resizable()
                    .frame(width: 305, height: 374)
                Text(item.text ?? "")
                    .modifier(TextBlack16())
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
                Text("Shop now")
                    .modifier(TextBlack14())
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
                    .underline()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(EdgeInsets(top: 0, leading: -28, bottom: 0, trailing: 0))
            .onTapGesture {
                path.append(RouterModel(destination: .productList))
            }
        })
        .singlePagination(ratio: 0.1)
        .preferredItemSize(CGSize(width: 305, height: 500))
        .itemSpacing(16)
        .frame(height: 500)
            //            CustomPageControl(numberOfPages: data.items.count, currentPage: $currentPage)
    }
}

struct CustomPageControl: UIViewRepresentable {

    let numberOfPages: Int
    @Binding var currentPage: Int

    func makeUIView(context: Context) -> UIPageControl {
        let view = UIPageControl()
        view.numberOfPages = numberOfPages
        view.backgroundStyle = .prominent
        view.addTarget(context.coordinator, action: #selector(Coordinator.pageChanged), for: .valueChanged)
        return view
    }

    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.numberOfPages = numberOfPages
        uiView.currentPage = currentPage
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject {
        var parent: CustomPageControl

        init(_ parent: CustomPageControl) {
            self.parent = parent
        }

        @objc func pageChanged(sender: UIPageControl) {
            parent.currentPage = sender.currentPage
            print(sender.currentPage)
        }
    }
}

#Preview {
    Home()
}
