building
buildSar
	self mappers
		do: [:each | each addToSar: self]
		displayingProgress: 'Building .sar'.
	self
		addString: (self fixupChunkTerminatorsIn: self preamble)
		at: 'install/preamble'.
	self postAddHooks do: #value.
	^ self zip