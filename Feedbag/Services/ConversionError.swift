//
//  JSONError.swift
//  Nosh
//
//  Created by Falquan on 4/11/16.
//  Copyright © 2016 Falquan. All rights reserved.
//

import Foundation

enum ConversionError : String, ErrorType {
    case NoData = "ERROR: no data"
    case ConversionFailed = "ERROR: conversion failed"
}
