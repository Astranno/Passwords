//
//  AppDelegate.swift
//  ApplePasswordManager
//
//  Created by Cameron Ingham on 3/1/21.
//

import Cocoa
import Combine
import PasswordManagerClient

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    
    private var cancellables = Set<AnyCancellable>()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        NSApp.setActivationPolicy(.accessory)

        PasswordManagerClient.live.showPasswordManager()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in
                NSApplication.shared.terminate(self)
                exit(0)
            }, receiveValue: { _ in })
            .store(in: &self.cancellables)
    }
}

