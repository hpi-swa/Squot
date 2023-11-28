image-hash
handleMovedImageFrom: oldHash to: newHash
	| doMove |
	doMove := (UIManager default
					chooseFrom: {'I copied it.'. 'I moved it.'}
					title:
						'The image is not where it used to be. Did you move or copy it?', String cr,
						'If in doubt, choose copy.')
					= 2.
	self allInstancesDo: [:each | each handleMovedImageFrom: oldHash to: newHash doMove: doMove].