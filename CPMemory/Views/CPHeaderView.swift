//
//  CPHeaderView.swift
//  CPMemory
//
//  Created by A255085 on 25/07/24.
//

import SwiftUI

struct CPHeaderView: View {
    var body: some View {
			HStack {
				Text("CPMemory")
					.font(.title2)
					.bold()
					.padding(.top)
					.padding(.horizontal)
					.padding(.leading, 6)
				
				Spacer()
				
				Button {
					NSApplication.shared.terminate(nil)
				} label: {
					Image(systemName: "xmark")
						.padding(4)
				}
				.clipShape(.circle)
			}
    }
}

#Preview {
    CPHeaderView()
}
