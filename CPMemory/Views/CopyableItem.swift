//
//  CopyableItem.swift
//  CPMemory
//
//  Created by A255085 on 23/07/24.
//

import SwiftUI

struct CopyableItem: View {
	let text: String
	
	@State private var isHovering: Bool = false
	
	var body: some View {
		HStack {
			Text(text)
				.multilineTextAlignment(.leading)
				.lineLimit(10)
			Spacer()
		}
		.padding()
		.background(self.isHovering ? Color.accentColor.opacity(0.4) : .gray.opacity(0.2))
		.clipShape(.rect(cornerRadius: 10))
		.onHover { isHovering in
			withAnimation {
				self.isHovering = isHovering
			}
		}
	}
}

#Preview {
    CopyableItem(text: "test")
}
