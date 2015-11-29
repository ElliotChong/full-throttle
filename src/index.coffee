DEFAULT_WAIT = 16 # 60fps

module.exports = (p_callback, p_backupWait) ->
	p_backupWait ?= DEFAULT_WAIT
	timeoutId = undefined
	isWaiting = false
	calledInbetween = false

	checkCalled = ->
		called = calledInbetween

		timeoutId = undefined
		isWaiting = false
		calledInbetween = false

		if called is true
			method.call @

	method = ->
		if isWaiting is true
			calledInbetween = true
			return

		isWaiting = true
		p_callback.call @

		if window?.requestAnimationFrame?
			timeoutId = window.requestAnimationFrame checkCalled.bind @
		else
			timeoutId = setTimeout checkCalled.bind(@), p_backupWait

	method.cancel = ->
		if not timeoutId?
			return

		if window?.requestAnimationFrame?
			window.cancelAnimationFrame timeoutId
		else
			clearTimeout timeoutId

	return method
