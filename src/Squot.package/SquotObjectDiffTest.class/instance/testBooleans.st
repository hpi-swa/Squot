testing
testBooleans
	self assert: true captureWithSquot = true captureWithSquot;
		assert: false captureWithSquot = false captureWithSquot;
		assert: true captureWithSquot ~= false captureWithSquot;
		assert: false captureWithSquot ~= true captureWithSquot.