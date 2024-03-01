
const Contents = [
	require '../guides/2-Language/basics.md'
	require '../guides/2-Language/caveats.md'
	require '../guides/2-Language/classes.md'
	require '../guides/2-Language/functions.md'
	require '../guides/2-Language/loops.md'
	require '../guides/2-Language/modules.md'
	require '../guides/2-Language/more.md'
	require '../guides/2-Language/switch.md'
	require '../guides/2-Language/tags.md'
]

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

	def setup
		const promise = Promise.all Contents.map do
			window.fetch $1
		promise.then do|response|
			for item in response
				item:ok and item.text.then do|resource|
					commit @contents.push MarkdownIt.render resource

	def render
		<self> for content in @contents
			<section html=content>