//
//  TinderUI.swift
//  SwiftUIProjects
//
//  Created by Subash Sethuraman A on 10/11/24.
//

import SwiftUI

struct TinderUI: View {
    
    @GestureState  var dragState = CGSize.zero
    @State  var position = CGSize.zero
    
    var body: some View {
        NavigationView{
            VStack{
                headerView
                    .padding(.bottom, 16)
                
                CardDeck(dragState: dragState, position: $position)
                Spacer()
                bottomBar
                
            }
            .navigationBarHidden(true)
        }
    }
}

struct TinderUI_Previews: PreviewProvider {
    static var previews: some View {
        TinderUI()
    }
}

extension TinderUI {
    private var headerView : some View {
        HStack{
            Image(systemName: "line.horizontal.3")
                .font(.system(size: 32))
            Spacer()
            Image(systemName: "mappin.and.ellipse")
                .font(.system(size: 32))
            Spacer()
            Image(systemName: "heart.circle.fill")
                .font(.system(size: 32))
            
        }
        .padding()
    }
    
    private var bottomBar : some View {
        HStack{
            Button {
                
            } label: {
                Image(systemName: "xmark")
            }
            Spacer()
            ZStack{
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.black)
                Text("BOOK IT NOW")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                
            }
            .frame( height: 48)
            
            Button {
                
            } label: {
                Image(systemName: "heart")
            }
            
            Spacer()
        }
        .foregroundColor(.black)
    }
}

struct CardDeck : View {
    @GestureState  var dragState : CGSize
    @Binding  var position : CGSize
    var body: some View{
        RoundedRectangle(cornerRadius: 12)
            .foregroundColor(.purple)
            .frame( maxWidth: .infinity,  maxHeight: UIScreen.main.bounds.height * 0.65)
            .padding()
            .offset(x: position.width , y: position.height + dragState.height)
            .rotationEffect(Angle(degrees: Double(position.width / 10.0)))
            .gesture(
            DragGesture()
                .updating($dragState, body: { value, state, trans in
                    state = value.translation
                })
                .onEnded({ (value) in
                    self.position.height += value.translation.height
                    self.position.width = value.translation.width
                })
            
            )
    }
}
