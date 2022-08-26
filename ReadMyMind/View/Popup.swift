//
//  Popup.swift
//  ReadMyMind
//
//  Created by Yuliya  on 8/21/22.
//
import Foundation
import SwiftUI

struct Popup<T: View>: ViewModifier {
    let popup: T
    let isPresented: Bool
    let direction: Direction
    let alignment: Alignment
    var background: some View {
    
        //RoundedCorners(color: Color(UIColor.systemBackground),
        
        RoundedCorners(color: Color("Color"),
                       tl: 10,
                       tr: 10,
                       bl: 10,
                       br: 10)
        .shadow(color: .black.opacity(0.2), radius: 3)
    }

    init(isPresented: Bool, alignment: Alignment, direction: Direction, @ViewBuilder content: () -> T) {
            self.isPresented = isPresented
            self.alignment = alignment
            self.direction = direction
            popup = content()
    }
        
    @ViewBuilder private func popupContent() -> some View {
            GeometryReader { geometry in
                if isPresented {
                    VStack{
                        // Text("NFC Tag is required")
                        popup
                        
                    }
                  //  .frame(maxWidth: .infinity)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 50)
                        .background(background)
                        .animation(.spring())
                        .transition(.offset(x: 0, y: direction.offset(popupFrame: geometry.frame(in: .global))))
                        .frame(width: geometry.size.width, height: geometry.size.height, alignment: alignment)
                }
            }
    }

    
    func body(content: Content) -> some View {
        content
            .overlay(popupContent())
    }
}

extension Popup {
    enum Direction {
        case top, bottom

        func offset(popupFrame: CGRect) -> CGFloat {
            switch self {
            case .top:
                let aboveScreenEdge = -popupFrame.maxY
                return aboveScreenEdge
            case .bottom:
                let belowScreenEdge = UIScreen.main.bounds.height - popupFrame.minY
                return belowScreenEdge
            }
        }
    }
}

private extension GeometryProxy {
    var belowScreenEdge: CGFloat {
        UIScreen.main.bounds.height - frame(in: .global).minY
    }
}

extension View {
    func popup<T: View>(
        isPresented: Bool,
        alignment: Alignment = .center,
        direction: Popup<T>.Direction = .bottom,
        @ViewBuilder content: () -> T
    ) -> some View {
        return modifier(Popup(isPresented: isPresented, alignment: alignment, direction: direction, content: content))
    }
}


struct Popup1_Previews: PreviewProvider {
    static var previews: some View {
        Color.clear
            .modifier(Popup(isPresented: true, alignment: .bottomLeading,  direction: .top,
                            content: { Color.yellow.frame(width: 200, height: 200) }))
    }
}

import SwiftUI

struct PopupView: View {

    let didClose: () -> Void

    var body: some View {
        VStack(spacing: .zero) {
            icon
            title
            content
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 24)
        .padding(.vertical, 40)
        .multilineTextAlignment(.center)
        .background(background)
        .overlay(alignment: .topTrailing) {
            close
        }
        .transition(.move(edge: .bottom))
    }
}


private extension PopupView {

    var close: some View {
        Button {
            didClose()
        } label: {
            Image(systemName: "xmark")
                .symbolVariant(.circle.fill)
                .font(.system(size: 35,
                              weight: .bold,
                              design: .rounded)
                )
                .foregroundStyle(.gray.opacity(0.4))
                .padding(8)
        }
    }

    var background: some View {
        RoundedCorners(color: .white,
                       tl: 10,
                       tr: 10,
                       bl: 0,
                       br: 0)
        .shadow(color: .black.opacity(0.2), radius: 3)
    }

    var icon: some View {
        Image(systemName: "tag.square.fill")
            .symbolVariant(.rectangle.fill)
            .font(.system(size: 50,
                          weight: .bold,
                          design: .rounded)
            )
            .foregroundColor(.mint)
    }

    var title: some View {
        Text("NFC tag required")
            .font(.system(size: 30, weight: .bold, design: .rounded))
            .padding()
    }

    var content: some View {
        Text("This task was connected to specific NFC tag. To finish this task please go to the location where the NFC tag is located and scan NFC tag. The task will be marked as done automatically.")
            .font(.callout)
            .foregroundColor(.black.opacity(0.8))
    }
}

struct RoundedCorners: View {
    var color: Color = .blue
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0

    var body: some View {
        GeometryReader { geometry in
            Path { path in

                let w = geometry.size.width
                let h = geometry.size.height

                // Make sure we do not exceed the size of the rectangle
                let tr = min(min(self.tr, h/2), w/2)
                let tl = min(min(self.tl, h/2), w/2)
                let bl = min(min(self.bl, h/2), w/2)
                let br = min(min(self.br, h/2), w/2)

                path.move(to: CGPoint(x: w / 2.0, y: 0))
                path.addLine(to: CGPoint(x: w - tr, y: 0))
                path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
                path.addLine(to: CGPoint(x: w, y: h - br))
                path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
                path.addLine(to: CGPoint(x: bl, y: h))
                path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
                path.addLine(to: CGPoint(x: 0, y: tl))
                path.addArc(center: CGPoint(x: tl, y: tl), radius: tl, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
                path.closeSubpath()
            }
            .fill(self.color)
        }
    }
}
