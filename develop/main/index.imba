
import './index.styl'

import Article as IntroductionArticle, Nav as IntroductionNav, Aside as IntroductionAside from './introduction'
import Article as LanguageArticle, Nav as LanguageNav, Aside as LanguageAside from './language'
import Article as EssentialsArticle, Nav as EssentialsNav, Aside as EssentialsAside from './essentials'
import Article as MiscellaneousArticle, Nav as MiscellaneousNav, Aside as MiscellaneousAside from './miscellaneous'

export tag Sketch < main
	@classes = ['']

	def render
		<self>
			<nav route='/*$'>
			<IntroductionNav route='/introduction'>
			<EssentialsNav route='/essentials'>
			<LanguageNav route='/language'>
			<MiscellaneousNav route='/miscellaneous'>

			<section route='/*$'>
				<h2> "Создавайте сложные веб-приложения легко!"
				<p> "Imba родился, чтобы снова сделать разработку веб-приложений увлекательной.
					Он имеет чистый и читаемый синтаксис, вдохновленный Ruby,
					компилируется в читаемый и производительный JavaScript и работает в рамках существующей экосистемы."

				<p> "Imba относится к элементам DOM как к полноценным объектам.
					Ваши декларативные представления компилируются в [память dom](/guides/advanced/performance),
					который работает [на порядок быстрее](https://somebee.github.io/dom-reconciler-bench/index.html)
					чем существующие виртуальные DOM-реализации. Мы искренне считаем, что это открывает новый способ разработки веб-приложений.
"
			<IntroductionArticle route='/introduction'>
			<EssentialsArticle route='/essentials'>
			<LanguageArticle route='/language'>
			<MiscellaneousArticle route='/miscellaneous'>

			<aside route='/*$'>
			<IntroductionAside route='/introduction'>
			<EssentialsAside route='/essentials'>
			<LanguageAside route='/language'>
			<MiscellaneousAside route='/miscellaneous'>
