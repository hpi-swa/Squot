ui
commitSelectionWrapped
	self commitSelection ifNotNil: [
		^ SquitVersionWrapper with: self commitSelection model: self].
	^ nil