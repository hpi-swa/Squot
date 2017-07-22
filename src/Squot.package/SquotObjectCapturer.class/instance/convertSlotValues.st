private
convertSlotValues
	slotsToConvert do: [:each | | shadow name namedShadow |
		shadow := convertedObjects at: each value undecorated.
		name := objectGraph nameOf: shadow undecorated ifAbsent: [nil].
		namedShadow := SquotNameDecorator on: shadow withName: name.
		each value: namedShadow].