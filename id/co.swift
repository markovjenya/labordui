import SwiftUI

struct CustomShape: Shape {
    var animatableData: AnimatableData {
        get {
            AnimatablePair(
                AnimatablePair(startX, startY),
                AnimatablePair(endX, endY)
            )
        }
        set {
            startX = newValue.first.first
            startY = newValue.first.second
            endX = newValue.second.first
            endY = newValue.second.second
        }
    }

    var startX: CGFloat
    var startY: CGFloat
    var endX: CGFloat
    var endY: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: startX, y: startY))
        path.addLine(to: CGPoint(x: endX, y: endY))
        return path
    }
}

struct ContentView: View {
    @State private var animate = false

    var body: some View {
        CustomShape(
            startX: animate ? 50 : 150,
            startY: animate ? 50 : 150,
            endX: animate ? 250 : 350,
            endY: animate ? 250 : 350
        )
        .stroke(Color.blue, lineWidth: 2)
        .animation(.linear(duration: 2))
        .onTapGesture {
            withAnimation {
                animate.toggle()
            }
        }
    }
}
