
const Intro = require '../guides/1-Essentials/introduction.md'

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
		<self>
			<ul> for part in document.querySelectorAll 'h2'
				<li :tap.scrollInto( part )> part:textContent

export tag Article < article
	@classes = ['']

	prop innro default: ''

	def setup
		window.fetch(Intro).then do|response|
			response:ok and response.text.then do|resource|
				Imba.commit @innro = MarkdownIt.render resource

	def render
		<self html=@innro>