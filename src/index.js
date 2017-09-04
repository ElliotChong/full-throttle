const DEFAULT_WAIT = 16 // 60fps
const hasRequestAnimationFrame = (typeof window !== 'undefined' && window !== null ? window.requestAnimationFrame : undefined) != null

function throttle (callback, fallbackDelay) {
	let timeoutId = undefined
	let isWaiting = false
	let calledInbetween = false
	let args = undefined

	function checkCalled () {
		const wasCalled = calledInbetween

		timeoutId = undefined
		isWaiting = false
		calledInbetween = false

		if (wasCalled === true) {
			return method.apply(this, args)
		}
	}

	function method () {
		args = arguments

		if (isWaiting === true) {
			calledInbetween = true
			return
		}

		isWaiting = true
		callback.apply(this, args)
		args = undefined

		if (hasRequestAnimationFrame) {
			timeoutId = window.requestAnimationFrame(checkCalled.bind(this))
		} else {
			timeoutId = setTimeout(checkCalled.bind(this), fallbackDelay != null ? fallbackDelay : DEFAULT_WAIT)
		}
	}

	method.cancel = function() {
		if ((timeoutId == null)) {
			return
		}

		if (hasRequestAnimationFrame) {
			return window.cancelAnimationFrame(timeoutId)
		} else {
			return clearTimeout(timeoutId)
		}
	}

	return method
}

module.exports = throttle
