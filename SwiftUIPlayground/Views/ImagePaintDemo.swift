//
//  ImagePaint.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 10/4/20.
//

import SwiftUI

struct ImagePaintDemo: View {
    var body: some View {
        Text("Hello World")
            .frame(width: 300, height: 300)
            .border(ImagePaint(image: Image("SpongeBob"), scale: 0.2), width: 30)
    }
}

struct ImagePaint_Previews: PreviewProvider {
    static var previews: some View {
        ImagePaintDemo()
    }
}
