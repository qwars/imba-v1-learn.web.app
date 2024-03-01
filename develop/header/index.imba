import './index.styl'

const Logo = require '../images/logo.svg?source'
const Logo-imba = require '../images/logo-imba.svg?source'

export tag Sketch < header
	@classes = ['']
	def render
		<self>
			<a route-to='/'>
				<span html=Logo>
				<dfn html=Logo-imba>
			<nav>
				<a route-to="/introduction"> "Введение"
				<a route-to="/essentials"> "Основа"
				<a route-to="/language"> "Синтаксис"
				<a route-to="/miscellaneous"> "Подробности"
			<aside>