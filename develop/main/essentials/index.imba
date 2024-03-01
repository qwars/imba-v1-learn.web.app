
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
		require '../guides/1-Essentials/custom-tags.md'
		require '../guides/1-Essentials/event-handling.md'
		require '../guides/1-Essentials/examples.md'
		require '../guides/1-Essentials/form-input-bindings.md'
		require '../guides/1-Essentials/rendering.md'
		require '../guides/1-Essentials/state-management.md'
		require '../guides/1-Essentials/tag-syntax.md'
	]

	def setup
		for item in resources
			@contents.push MarkdownIt.render item

	def render
		<self>
			for content in @contents
				<section html=content>