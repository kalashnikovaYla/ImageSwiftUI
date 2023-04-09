//
//  ContentView.swift
//  ImageSwiftUI
//
//  Created by sss on 09.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    let image = UIImage(named: "image1") ?? UIImage()
    
    
    var body: some View {
        VStack {
            backGroundImageView
            logoImageView
            
            Text("Converse")
                .foregroundColor(.white)
                .fontWeight(.heavy)
                .font(.largeTitle)
            
            asyncImageView
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width)
        .background(
            VStack {
                LinearGradient(colors: [Color.black, Color.green.opacity(0.7)], startPoint: .top, endPoint: .bottom)
            }.ignoresSafeArea(.all, edges: .all)
        )
    }
    
    var logoImageView: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 300, height: 300)
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
            
    }
    
    var backGroundImageView: some View {
        Image("image")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 400, height: 0)
            .ignoresSafeArea()
    }
    
    var asyncImageView: some View {
        
        AsyncImage(url: URL(string: "https://picsum.photos/401")) { phase in
            
            switch phase {
            case .empty:
                ProgressView()
                    .accentColor(.white)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width:100, height: 100)
                    .cornerRadius(20)
            case .failure(let error):
                VStack {
                    Image(systemName: "questionmark")
                    Text(error.localizedDescription)
                        .font(.headline)
                }
            @unknown default:
                fatalError()
            }
        }
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
