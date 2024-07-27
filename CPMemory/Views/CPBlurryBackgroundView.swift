//
//  CPBlurryBackgroundView.swift
//  CPMemory
//
//  Created by A255085 on 23/07/24.
//

import Cocoa
import SwiftUI

struct CPBlurryBackgroundView: NSViewRepresentable {
	let colorScheme: ColorScheme
	
	var appearance: NSAppearance? {
		if colorScheme == .dark {
			return NSAppearance(named: .vibrantDark)
		}
		
		return NSAppearance(named: .vibrantLight)
	}
	
	func makeNSView(context: Context) -> some NSView {
		let blurryView = NSVisualEffectView()
		
		blurryView.blendingMode = .behindWindow
		blurryView.appearance = appearance
		blurryView.state = .active
		
		return blurryView
	}
	
	func updateNSView(_ nsView: NSViewType, context: Context) {
		nsView.appearance = appearance
	}
}
