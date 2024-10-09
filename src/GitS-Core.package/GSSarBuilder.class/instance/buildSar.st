building
buildSar
	self mappers
		do: [:each | each addToSar: self]
		displayingProgress: [:each | 'Building .sar - adding {1}' format: {each name}].
	self
		addString: (self fixupChunkTerminatorsIn: self preamble)
		at: 'install/preamble'.
	self postAddHooks do: #value.
	^ self zip