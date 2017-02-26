public
openFileStream: path writable: aBoolean
	| fullPath |
	fullPath := self stringFromPath: path.
	^ StandardFileStream new open: fullPath forWrite: aBoolean