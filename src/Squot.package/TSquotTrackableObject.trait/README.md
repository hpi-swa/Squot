I document the messages that let objects control how Squot handles them.

Object implements most of the messages defined here, so you do not need to use this Trait.
It suffices to override the appropriate methods.

The following methods are additionally relevant for trackable Objects and can be redefined:

captureWithSquot: anObjectCapturer
	Converts a "living" object into a shadow with the help of the capturer.
	The capturer must handle cycles in the object graph and to avoid endless computation.

captureWithSquot
	Converts a "living" object into a shadow. Should create an own capturer for the task and delegate to #captureWithSquot: if the object graph that must be captured can contain cycles.