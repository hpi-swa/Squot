accessing
trackedFiles

	^ trackedFiles ifNil: [self collectTrackedFiles. trackedFiles]