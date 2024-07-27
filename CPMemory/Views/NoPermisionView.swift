//
//  NoPermisionView.swift
//  CPMemory
//
//  Created by A255085 on 25/07/24.
//

import SwiftUI

struct NoPermisionView: View {
    var body: some View {
			VStack {
				Text("No permission granted.\nPlease click the button bellow\n so the app works properly")
					.multilineTextAlignment(.center)
					.padding(.bottom)
				
				Button("Grant Permission") {}
			}
			.frame(maxWidth: 200)
    }
}

#Preview {
    NoPermisionView()
}
