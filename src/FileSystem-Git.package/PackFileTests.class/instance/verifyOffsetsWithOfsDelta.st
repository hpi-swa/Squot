helpers-verifying
verifyOffsetsWithOfsDelta
	"the positions are given as additions because git uses zero based
	indices while Smalltalk uses 1 based indices. So the byte at position
	12 in the file is at position 12 + 1 in the ByteArray.
	
	The first header byte of each entry has the form
	xyyyzzzz
	x: 	if 1then another header byte follows
		if 0 then data follows
	y: 	001 - OBJ_COMMIT
		010 - OBJ_TREE
		011 - OBJ_BLOB
		100 - OBJ_TAG
		110 - OBJ_OFS_DELT (new packfile format)
		111 - OBJ_REF_DELTA (old packfile format)
	z: four least significant bits of bits describing size (see #getSizeFromHeaders:)"
	| content |
	content := packReader contents.
	self assert: 2r00010000 equals: ((content at: 12+1) bitAnd: 2r01110000). "commit"
	self assert: 2r00010000 equals: ((content at: 161+1) bitAnd: 2r01110000). "commit"
	self assert: 2r00010000 equals: ((content at: 310+1) bitAnd: 2r01110000). "commit"
	self assert: 2r00100000 equals: ((content at: 429+1) bitAnd: 2r01110000). "tree"
	self assert: 2r00110000 equals: ((content at: 473+1) bitAnd: 2r01110000). "blob"
	self assert: 2r00100000 equals: ((content at: 705+1) bitAnd: 2r01110000). "tree"
	self assert: 2r01100000 equals: ((content at: 749+1) bitAnd: 2r01110000). "ofs_delta (blob)"
	self assert: 2r00100000 equals: ((content at: 776+1) bitAnd: 2r01110000). "tree"
	self assert: 2r01100000 equals: ((content at: 820+1) bitAnd: 2r01110000) "ofs_delta (blob)"