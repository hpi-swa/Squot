removing
removeAt: path
	artifacts removeKey: path ifAbsent: [].
	loadOrder remove: path ifAbsent: [].