running
updateRefs
	self refsToUpdate
		keysAndValuesDo: [:ref :target |
			self unitOfWork
				updateRef: ref
				to: target asHexHash
				message: 'update-ref: ', target asHexHash];
		removeAll.