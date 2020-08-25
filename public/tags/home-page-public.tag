<home-page-public>

	<!-- HTML -->
	<div class="container-fluid">
        <carousel-and-title/>
        <hr>
        <club-info/>
    </div>

	<!-- JavaScript -->
	<script>
		console.log('in home-page-public.tag');
        var that = this;
        this.user = firebase.auth().currentUser;
	</script>

	<!-- CSS -->
	<style>
		* {
			-webkit-transition: .25s ease-in;
			transition: .25s ease-in;
		}
		:scope {
			display: block;
		}
		.wrap:hover div:not(:hover) {
			-webkit-filter: grayscale(1);
			filter: grayscale(1);
			opacity: .75;
		}
	</style>

</home-page-public>
