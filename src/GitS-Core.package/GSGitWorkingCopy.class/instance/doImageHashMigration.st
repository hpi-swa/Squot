migrations
doImageHashMigration
	self lastImageHashForMigration ifNil: [^ self].
	self lastImageHashForMigration ~= self imageHash ifTrue: [
		self
			handleMovedImageFrom: self lastImageHashForMigration
			to: self imageHash
			doMove: true].
	self clearLastImageHashForMigration.