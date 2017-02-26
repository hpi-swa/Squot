as yet unclassified
postorder: aReference
	^ self visit: aReference with: (FSPostorderGuide for: self)