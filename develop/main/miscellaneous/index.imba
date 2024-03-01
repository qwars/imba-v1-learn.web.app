
export tag Aside < aside
	@classes = ['']
	def render
		<self>

export tag Nav < nav
	@classes = ['']

	def scrollInto point
		for item in  document.querySelectorAll 'h1, h2'
			if item:textContent === point:textContent
				item.scrollIntoView
					behavior: 'smooth'
				break

	def render
		<self> <ul> for part in document.querySelectorAll 'h1'
			<li>
				<span :tap.scrollInto( part )> part:textContent
				<ul> for item in part:parentElement .querySelectorAll 'h2'
					<li :tap.scrollInto( item ) > item:textContent

export tag Article < article
	@classes = ['']

	prop contents default: []
	prop resources default: [
		require '../guides/3-Miscellaneous/Scheduler.md'
		require '../guides/3-Miscellaneous/Tag.md'
		require '../guides/3-Miscellaneous/Touch.md'

		# require '../guides/3-Miscellaneous/Advanced/development.md'
		require '../guides/3-Miscellaneous/Advanced/performance.md'
		# require '../guides/3-Miscellaneous/Advanced/release.md'
		require '../guides/3-Miscellaneous/Advanced/routing.md'

		require '../guides/3-Miscellaneous/Tooling/plugins.md'
		require '../guides/3-Miscellaneous/Tooling/tools.md'

	]

	def setup
		for item in resources
			@contents.push MarkdownIt.render item

	def render
		<self> for content in @contents
			<section html=content>