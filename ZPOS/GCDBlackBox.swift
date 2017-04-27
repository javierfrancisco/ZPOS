//
//  GCDBlackBox.swift
//  ZPOS
//
//  Created by zenkiu on 4/26/17.
//  Copyright © 2017 zenkiu. All rights reserved.
//


import Foundation

func performUIUpdatesOnMain(_ updates: @escaping () -> Void) {
    DispatchQueue.main.async {
        updates()
    }
}
