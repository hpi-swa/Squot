private
finalizeWeakCaches
	versionsCache keysAndValuesRemove: [:key :value | value isNil].