
window.fetch(require '../guides/1-Essentials/introduction.md').then do|response|
	response and response.text.then do|resource|
			Imba.commit Imba:Content = MarkdownIt.render resource


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

export tag Article < article
	@classes = ['']

	def render
		<self html=Imba:Content>