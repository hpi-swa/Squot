actions
actionForcePush: refString
	(self confirm: 'Do you really want to force push? This might discard commits made by other members of your team.')
		ifFalse: [^ self].
	^ self actionPush: refString force: true