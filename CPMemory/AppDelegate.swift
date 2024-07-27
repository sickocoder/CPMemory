//
//  AppDelegate.swift
//  CPMemory
//
//  Created by A255085 on 25/07/24.
//

import AppKit
import SwiftUI
import HotKey


class AppDelegate: NSObject, NSApplicationDelegate, ObservableObject {
	
	private var statusItem: NSStatusItem!
	private var window: NSWindow!
	private var viewController: NSViewController!
	
	private var isEventAlreadySet: Bool = false
	
	func applicationDidFinishLaunching(_ notification: Notification) {
		// Setup tray icon
		self.statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
		
		if let statusButton = self.statusItem.button {
			statusButton.image = NSImage(systemSymbolName: "doc.on.clipboard.fill", accessibilityDescription: "Clipboard")
			statusButton.action = #selector(toggleWindow)
		}
		
		
		let screenWidth = NSScreen.main?.frame.size.width  ?? 0
		let screenHeight = NSScreen.main?.frame.size.height ?? 0
		
		// Create NSWindow
		self.window = NSWindow(
			contentRect: NSRect(
				x: screenWidth - CPUtils.Measurements.appWindowWidth,
				y: screenHeight - CPUtils.Measurements.appWindowHeigth,
				width: CPUtils.Measurements.appWindowWidth,
				height: CPUtils.Measurements.appWindowHeigth
			),
			styleMask: [.borderless],
			backing: .buffered,
			defer: false
		)
		
		self.window.standardWindowButton(.miniaturizeButton)?.isHidden = true
		self.window.standardWindowButton(.zoomButton)?.isHidden = true
		self.window.isReleasedWhenClosed = false
		
		let rootView = NSHostingView(rootView: ContentView())
		self.window.contentView = rootView
		self.window.backgroundColor = .clear
		//		self.window.hidesOnDeactivate = true
	}
	
	
	//	func applicationDidResignActive(_ notification: Notification) {
	//		if !isEventAlreadySet {
	//			isEventAlreadySet = true⌘√
	//			NSEvent.addGlobalMonitorForEvents(matching: .keyDown) { event in
	//				let modifiedFlags = event.modifierFlags.intersection(.deviceIndependentFlagsMask)
	//
	//				if (modifiedFlags == [.command, .option] || modifiedFlags == [.option, .command]),
	//					 event.keyCode == 9
	//				{
	//					self.toggleWindow()
	//				}
	//			}
	//		}
	//	}
	
	func applicationDidHide(_ notification: Notification) {
		print("app is hidden but running")
	}
	
	func animateWindow() {
		window.animationBehavior = .none
		window.alphaValue = 0
		window.makeKeyAndOrderFront(nil)
		NSAnimationContext.runAnimationGroup({ (context) -> Void in
			context.duration = 0.3
			window.animator().alphaValue = 1
		}, completionHandler: nil)
	}
	
	
	@objc
	func toggleWindow(_ sender: Any?) {
		print("called")
		if self.statusItem.button != nil {
			if window.isVisible {
				self.window.orderOut(nil)
			} else {
				animateWindow()
				NSApp.activate(ignoringOtherApps: true)
			}
		}
	}
}

