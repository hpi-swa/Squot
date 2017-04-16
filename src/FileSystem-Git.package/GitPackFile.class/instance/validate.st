validating
validate
	| packedObjects |
	self readStream: self readStream.
	[readStream reset.
	self readHeaders.
	packedObjects := OrderedCollection new.
	objectCount timesRepeat: 
		[ | start | start := readStream position.
		packedObjects add: (self objectAtOffset: readStream position).
		readStream position: start + packedObjects last lengthInPack].
	self assert: readStream position = (readStream size - 20) description: 'superfluous data'.
	self flag: 'TODO: validate the final hash'.
	packedObjects do: [:each | each object validate]]
	ensure:
		[readStream close.
		readStream := nil].
	