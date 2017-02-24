tests
testWriteObjectHeaderOn
	| blob file contents |
	blob := GitBlob bytes: 'my blob with size greater than 32' in: nil.
	file := FileSystem memory root / 'afile'.
	file writeStreamDo: [ :stream | creator writeObjectHeader: blob on: stream ].
	contents := file readStreamDo: [ :stream | stream binary; contents ].
	
	self assert: contents size equals: 2.
	"leading one: more header bytes follow
	011: blob typecode
	0001 size of blob part 1 (lower bits)"
	self assert: (contents at: 1) equals: 2r10110001.
	"leading zero: no more header bytes follow
	0000001: size of blob part 2 (higher bits)"
	self assert: (contents at: 2) equals: 2r00000010