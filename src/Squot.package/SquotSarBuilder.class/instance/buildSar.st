building
buildSar
	self mappers
		do: [:each | each addToSar: self]
		displayingProgress: 'Building .sar'.
	self zip addString: self preamble as: 'install/preamble'.
	self postAddHooks do: #value.
	^ self zip