//
//  CPMemoryApp.swift
//  CPMemory
//
//  Created by Sickocoder on 12/07/24.
//
import SwiftUI

@main
struct MenuBarApp_SwiftUIApp: App {
	@NSApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
	
	var body: some Scene {
		Settings {}
	}
}

