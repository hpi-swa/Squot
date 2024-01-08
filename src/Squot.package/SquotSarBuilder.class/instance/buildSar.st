building
buildSar
	self mappers do: [:each | each addToSar: self].
	self zip addString: self preamble as: 'install/preamble'.
	^ self zip