
const content = require '../guides/1-Essentials/introduction.md'

const introduction = MarkdownIt.render content

export tag Aside < aside
	@classes = ['']
	def render
		<self>

export tag Nav < nav
	@classes = ['']

	def scrollInto point
		for item in  document.querySelectorAll 'h2'
			if item:textContent === point:textContent
				item.scrollIntoView
					behavior: 'smooth'
				break

	def render
		<self>
			<ul> for item in document.querySelectorAll 'h2'
				<li :tap.scrollInto( item )> item:textContent

export tag Article < article
	@classes = ['']

	def render
		<self html=introduction>