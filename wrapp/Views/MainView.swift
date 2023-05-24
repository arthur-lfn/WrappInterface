//
//  SouvenirsView.swift
//  wrapp
//
//  Created by Arturo Alfani on 21/02/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = WrappingViewModel()

    @State private var startWrapping: Bool = false
    @State private var showDrafts = false
    @State var snapshotWidgetImage = Snap()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    if showDrafts {
                        Section {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    PlaceholderView(fillColor: "AccentColor", ribbonName: "", fontCustomName: "", fontDescription: "")
                                }
                            }
                            .listRowBackground(Color.clear)
                        } header: {
                            Text("Drafts")
                                .foregroundColor(.black)
                        }
                    }
                    Section {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(viewModel.allRibbons) { placeholder in
                                    PlaceholderView(fillColor: "PlaygroundComponents", ribbonName: placeholder.ribbonName, fontCustomName: "", fontDescription: "")
                                }
                            }
                        }
                        .listRowBackground(Color.clear)
                    } header: {
                        Text("Received")
                            .foregroundColor(.black)
                    }
                    Section {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                Button {
                                    startWrapping = true
                                } label: {
                                    ZStack {
                                        PlaceholderView(fillColor: "AccentColor", ribbonName: "", fontCustomName: "", fontDescription: "")
                                            .overlay(alignment: .center) {
                                                Image(systemName: "plus.circle.fill")
                                                    .font(.system(size: 60))
                                                    .fontWeight(.black)
                                                    .foregroundColor(.white)
                                            }
                                    }
                                }
                                .buttonStyle(.plain)
                                ForEach(viewModel.allRibbons) { placeholder in
                                    PlaceholderView(fillColor: "PlaygroundComponents", ribbonName: placeholder.ribbonName, fontCustomName: "", fontDescription: "")
                                }
                            }
                        }
                        .listRowBackground(Color.clear)
                    } header: {
                        Text("Sent")
                            .foregroundColor(.black)
                    }
                }
                .listStyle(.plain)
                .toolbar {
                    Button {
                        startWrapping = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 30))
                            .overlay(alignment: .center) {
                                Circle()
                                    .stroke(Color("FeaturesText"), lineWidth: 2)
                                    .offset(x: -0.25)
                            }
                    
                    }
                }
            }
            .navigationTitle("souveniers")
            .sheet(isPresented: $startWrapping) {
                WrappingView()
            }
        }
    }
}

struct SouvenirsView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
