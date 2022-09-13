installing
ensureValidFromUnixTimeImplementation
	"If DateAndTime fromUnixTime: answers timestamps with a local timezone offset, override the method to return timestamps without an offset. This is invoked from the package postscript."
	"self ensureValidFromUnixTimeImplementation"
	| originalTimeZone tzWithOffset |
	originalTimeZone := DateAndTime localTimeZone.
	tzWithOffset := TimeZone offset: 2 hours name: 'Test time zone' abbreviation: 'TEST'.
	DateAndTime localTimeZone: tzWithOffset.
	[InadequateFromUnixTimeImplementation :=
		(DateAndTime fromUnixTime: 0) offset isZero not]
	ensure:
		[DateAndTime localTimeZone: originalTimeZone].
	InadequateFromUnixTimeImplementation ifTrue: [self installFromUnixTimeReplacement].
	^ InadequateFromUnixTimeImplementation