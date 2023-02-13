<script lang="ts">
	import { onMount } from 'svelte'
	import { Router, Route, Link } from 'svelte-navigator'
	import Navigate from './Navigate.svelte'
	import axios from 'axios'

	export let name: string
	export let baseURL: string

	onMount(() => {
		axios
			.get('http://localhost:8080/api/item/1')
			.then((response) => response.data)
			.then((data) => console.log(data))
	})
</script>

<Router>
	<nav>
		<Link to={baseURL}>Base</Link>
		<Link to="{baseURL}/123">{`${baseURL}/123`}</Link>
		<Link to="{baseURL}/123/456">{`${baseURL}/123/456`}</Link>
	</nav>

	<Navigate />

	<main>
		<h1>name {name}!</h1>
		<p>baseURL {baseURL}</p>

		<Route path="{baseURL}/:id" let:params>
			<h3>{baseURL}/{params.id}</h3>
			<pre>{JSON.stringify(params)}</pre>
		</Route>

		<Route path={baseURL}>
			<h3>home</h3>
		</Route>

		<!--unmatched routes go here-->
		<Route>
			<h3>not found</h3>
		</Route>
	</main>
</Router>
