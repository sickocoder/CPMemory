//
//  ContentView.swift
//  CPMemory
//
//  Created by A255085 on 12/07/24.
//

import SwiftUI
import Cocoa

struct ContentView: View {
	let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
	
	@Environment(\.colorScheme) var colorScheme
	
	@State var pastboardStringHistory: [String] = []
	@State private var isAccessToPastboardGranted: Bool = false
	
	var body: some View {
		ZStack {
			CPBlurryBackgroundView(colorScheme: colorScheme)
				.cornerRadius(CPUtils.Measurements.appCornerRadius)
				.padding()
			
			if !isAccessToPastboardGranted {
				NoPermisionView()
			} else {
				VStack {
					CPHeaderView()
					
					List {
						VStack(spacing: 10) {
							ForEach(self.pastboardStringHistory, id: \.self) { item in
								CopyableItem(text: item)
									.onTapGesture {
										setPasteableValue(valueToPaste: item)
									}
							}
						}
						.padding(.horizontal)
					}
				}
				.listStyle(.plain)
				.scrollContentBackground(.hidden)
				.padding()
			}
		}
		.frame(width: CPUtils.Measurements.appWindowWidth)
		.cornerRadius(CPUtils.Measurements.appCornerRadius)
		.onReceive(timer) { _ in
			self.checkPastboard()
		}
	}
	

}

extension ContentView {
	func checkPastboard() {
		let options: NSDictionary = [kAXTrustedCheckOptionPrompt.takeUnretainedValue() as String : true]
		let accessEnabled = AXIsProcessTrustedWithOptions(options)
		self.isAccessToPastboardGranted = accessEnabled
		
		if !accessEnabled {
			print("Access Not Enabled")
			return
		}
		
		
		let pastboard = NSPasteboard.general
		let pastboardStringData = pastboard.readObjects(forClasses: [NSString.self], options: nil)
		let pastboardItem = pastboardStringData as! [NSString]
		
		if 0 < pastboardItem.count {
			if !pastboardStringHistory.contains(pastboardItem[0] as String) {
				pastboardStringHistory.append(pastboardItem[0] as String)
			}
		}
	}
	
	func setPasteableValue(valueToPaste: String) {
		let pastboard = NSPasteboard.general
		pastboard.declareTypes([.string], owner: nil)
		
		pastboard.clearContents()
		pastboard.setString(valueToPaste, forType: .string)
	}
}

#Preview {
	ContentView()
}




