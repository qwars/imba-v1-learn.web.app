
export tag Application < output
	prop loading default: true
	prop waiting default: true
	prop messages default: []

	def setup

		@loading = false

		const datastate = self
		extend tag element
			def application
				datastate

	def message
		@messages

	def message= v
		const idx = @messages.push v
		setTimeout(&, 20000) do Imba.commit @messages.splice( idx - 1, 1) unless  @messages[idx]:no-hide

	def invalidCompletion e
		if e then message = Object.assign e,
			name:  'invalid',
			message: e:message

	def warningCompletion e
		if e then message = Object.assign e,
			name:  'warning',
			message: e:message

	def announcementCompletion e
		if e then message = Object.assign e,
			name:  'announcement',
			message: e:message

	def render
		<self .loading=@loading>
			<ul.messages> for item in @messages
				<li .{ item:name }> item:message

