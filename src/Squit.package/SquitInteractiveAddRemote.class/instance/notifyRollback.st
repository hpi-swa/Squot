private
notifyRollback
	rollbackCallbacks ifNil: [^ self].
	rollbackCallbacks do:
		[:each | each cull: query].