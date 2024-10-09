accessing
activeRefTreeMember: aRefTreeMember
	self basicActiveRefTreeMember: aRefTreeMember.
	self activeRefCommit ifNotNil: [:commit | self activeCommit: commit].
	self
		changed: #activeRefTreeMember;
		changed: #commitList.