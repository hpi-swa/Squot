private
notifyRemoteAdded
	remoteAddedCallbacks ifNil: [^ self].
	remoteAddedCallbacks do:
		[:each | each cull: query].