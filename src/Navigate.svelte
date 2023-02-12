<script lang="ts">
	import { useLocation } from 'svelte-navigator'

	const location = useLocation()
	$: {
		const { pathname, search, state, hash } = $location
		console.group('navigate')
		console.log('pathname', pathname)
		console.log('search', new URLSearchParams(search))
		console.log('state', state)
		console.log('hash', hash)
		console.groupEnd()
	}
</script>
