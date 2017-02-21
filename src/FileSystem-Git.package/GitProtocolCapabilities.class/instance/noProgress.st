capabilities
noProgress

	"The client was started with 'git clone -q' or something, and doesn't
want that side band 2.  Basically the client just says 'I do not
wish to receive stream 2 on sideband, so do not send it to me, and if
you did, I will drop it on the floor anyway'.  However, the sideband
channel 3 is still used for error responses."

	^ self enable: #'no-progress'