accessing
activeRef: aString
	self basicActiveRef: aString.
	self activeRefCommit ifNotNil: [:commit | self activeCommit: commit].
	self
		changed: #activeRef;
		changed: #commitList.