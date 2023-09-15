accessing
activeRef: aString
	activeRef := aString.
	self activeRefCommit ifNotNil: [:commit | self activeCommit: commit].
	self
		changed: #activeRef;
		changed: #commitList.