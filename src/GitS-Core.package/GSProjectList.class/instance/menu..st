toolbuilder
menu: aMenu
	self menuSelector ifNil: [^ aMenu].
	^ self model perform: self menuSelector with: aMenu