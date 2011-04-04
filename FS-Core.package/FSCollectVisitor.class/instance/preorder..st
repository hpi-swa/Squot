ordering
preorder: aReference
	^ self visit: aReference with: (FSPreorderGuide for: self)