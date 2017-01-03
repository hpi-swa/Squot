tests
testUpdateReferences
	| newRefs oldRefs |
	oldRefs := { 'refs/heads/master' -> 'c70f1e4ab9f7226e908d27b7ed24651527589a6a' } as: Dictionary.
	newRefs := { 'refs/heads/master' -> '107a203c2b5b5cf25fe759069ea8026a4ad6bcb9' }.
	self
		withWriterAssert: [ :writer |
				writer
					writeUpdateReferences: newRefs
					deleteReferences: Array empty
					previousReferences: oldRefs ]
		equals: 
			'0080c70f1e4ab9f7226e908d27b7ed24651527589a6a 107a203c2b5b5cf25fe759069ea8026a4ad6bcb9 refs/heads/master', 
			Character null, 'report-status ofs-delta', String lf