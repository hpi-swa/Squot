*SquotTonel-Core
currentPackageProperties	
	^ (self packageDirectory notNil and: [self fileUtils filePathExists: 'package.st' relativeTo: self packageDirectory])
		ifTrue: [
			(self packageDirectory / 'package.st') readStreamDo: [:stream |
				((stream upTo: Character space) = 'Package')
					ifTrue: [STON fromStream: stream]
					ifFalse: [Dictionary new]]]
		ifFalse: [Dictionary new]