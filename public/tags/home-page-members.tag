<home-page-members>

	<!-- HTML -->
	<div class="container-fluid">
        <carousel-and-title/>
        <hr>
        <club-info/>
	</div>

	<!-- JavaScript -->
	<script>
		console.log('home-page-members.tag');
        var that = this;
		this.user = firebase.auth().currentUser;
        console.log('this.user = ', this.user);
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
	</style>
</home-page-members>
