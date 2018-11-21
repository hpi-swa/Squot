creating versions
messageWhenMergingInto: aHistorian
	^ self isRemoteTrackingHistorian
		ifTrue: ['Merge branch ''', self remoteRef shortName, ''' of ', self remoteName, ' into ', aHistorian shortName]
		ifFalse: ['Merge branch ''', self shortName, ''' into ', aHistorian shortName]