private
copy: aPath toReference: destRef
	| in path |
	path := self resolve: aPath.
	[in := self readStreamOn: path.
	in ifNil: [ store signalFileDoesNotExist: path ].
	destRef filesystem copyFrom: in to: destRef path ] 
		ensure: [ in ifNotNil: [ in close ] ]