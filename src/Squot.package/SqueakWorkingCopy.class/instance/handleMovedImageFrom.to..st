image-hash
handleMovedImageFrom: oldHash to: newHash
	| doMove oldPrefix newPrefix oldRefs |
	doMove := (UIManager default
					chooseFrom: {'I copied it.'. 'I moved it.'}
					title:
						'The image is not where it used to be. Did you move or copy it?', String cr,
						'If in doubt, choose copy.')
					= 2.
	oldPrefix := self refsBaseNameForHash: oldHash.
	newPrefix := self refsBaseNameForHash: newHash.
	self withUnitOfWork: [
		oldRefs := self allReferences select: [:each | each startsWith: oldPrefix].
		oldRefs do: [:oldRef | | newRef |
			newRef := newPrefix, (oldRef allButFirst: oldPrefix size).
			self unitOfWork
				perform: (doMove ifTrue: [#moveRef:to:] ifFalse: [#copyRef:to:])
				with: oldRef
				with: newRef].
		self allReferences do: [:each | | ref target |
			ref := self unitOfWork ref: each.
			((ref name startsWith: newPrefix)
				and: [ref isSymbolic]
				and: [(target := ref targetRef) startsWith: oldPrefix])
				ifTrue: [
					self unitOfWork updateSymbolicRef: ref name toRef: newPrefix, (target allButFirst: oldPrefix size) message: nil]]].