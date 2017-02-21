I am an abstract class defining common protocol for git objects that behave like tags.

Instance Variables:
	message	<String>
		Holds the message of the tag like object, if used.
	properties	<(Collection of: (Association of: String -> ByteArray))>
		Holds arbitrary key value pairs not specified by git that can be used by applications to store additional data.