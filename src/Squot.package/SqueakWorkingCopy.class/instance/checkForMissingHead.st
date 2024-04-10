importing
checkForMissingHead
	self headCommit ifNotNil: [^ self].
	{'main'. 'master'} do: [:each |
		(self unitOfWork resolveRef: (self gitBranchName: each)) ifNotNilDo: [:target |
			self updateHeadTo: target.
			^ self]].