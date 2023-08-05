tests
testStampReadingInAnotherTimezone
	| originalTimeZone tzWithOffset |
	originalTimeZone := DateAndTime localTimeZone.
	tzWithOffset := ((self environment classNamed: #FixedTimeZone) ifNil: [TimeZone]) offset: 2 hours name: 'Test time zone' abbreviation: 'TEST'.
	DateAndTime localTimeZone: tzWithOffset.
	[self testStampReading] ensure: [DateAndTime localTimeZone: originalTimeZone].