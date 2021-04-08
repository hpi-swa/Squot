private
convertSlotValues
	slotsToConvert do: [:each | | referrer reference mirror shadow name namedShadow shadowMirror shadowReference shadowReferrer |
		shadowReferrer := each first.
		shadowMirror := each second.
		shadowReference := each third.
		referrer := each fourth.
		mirror := each fifth.
		reference := each sixth.
		shadow := convertedObjects at: (mirror reflect: reference of: referrer) undecorated.
		name := objectGraph nameOf: shadow undecorated ifAbsent: [nil].
		namedShadow := SquotNameDecorator on: shadow withName: name.
		shadowMirror reflect: shadowReference of: shadowReferrer put: namedShadow].