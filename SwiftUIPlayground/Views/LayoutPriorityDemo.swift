//
//  LayoutPriorityDemo.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 10/3/20.
//

import SwiftUI

let longText = """
Cross-lingual model pretraining and Denoising Auto-Encoding alone are enough to generate translations. However, the quality of these translations tends to be low, as the model is never trained to do what it is expected to do at test time, i.e., to translate functions from one language to another. To address this issue, we use back-translation, which is one of the most effective methods to leverage monolingual data in a weakly supervised scenario. We use a single model and a different start token for each target language. It is trained to translate from source to target and from target to source in parallel. The target-to-source version is used to translate target sequences into the source language, producing noisy source sequences corresponding to the ground truth target sequences. The model can then be trained in a weakly supervised manner to reconstruct the target sequences from the noisy source sequences and learn to translate from source to target. The target-to-source and source-to-target versions are trained in parallel until convergence.

To evaluate their models, most previous studies of source-code translation have relied on metrics used in natural language, such as BLEU score or other methods based on the relative overlap between tokens. These types of metrics are not well suited to programming languages, however.
"""

struct LayoutPriorityDemo: View {
    
    var body: some View {
        GeometryReader { geometry in
                VStack {
                    Image("BuzzAldrin")
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: geometry.size.height * 0.75)
                        .layoutPriority(1)
                    
                    Text(longText).frame(maxHeight: geometry.size.height * 0.75)
                        .layoutPriority(2) //the higher layout priority gets dibs
                }
        }
        .padding()
        .navigationBarTitle(Text("Layout Priority"), displayMode: .inline)
    }
}

struct LayoutPriorityDemo_Previews: PreviewProvider {
    static var previews: some View {
        LayoutPriorityDemo()
    }
}
