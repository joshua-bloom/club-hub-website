<user-profile-photo>
	<a class="jumbotron-links" href="#my-profile">
		<div class="btn btn-lg btn-default" type="button">
			<figure>
				<img id="user-photo" src={ userPhotoURL } alt="user profile photo" width="50px" height="50px">
				<!--
                    Display user's first name
                    <figcaption class="pull-right"><h3>{ userName.substr(0,user.displayName.indexOf(' ')) }</h3></figcaption>
                -->
			</figure>
		</div>
	</a>

	<script>
		var that = this;
		this.user = firebase.auth().currentUser;

		this.userPhotoURL = "http://placehold.it/100x100.png";		// Default user photo to placeholder
		this.userName = "First Last Name";

		if (this.user.photoURL) {							// If they have a (Google) photo...
			this.userPhotoURL = this.user.photoURL;				// display their photo instead of the placeholder
		}
		if (this.user.displayName) {
			this.userName = this.user.displayName;
		}

	</script>

	<style>
		* {
			-webkit-transition: .25s ease-in;
			transition: .25s ease-in;
		}
		:scope {
			display: inline-block;
		}
		figure {
			text-align: center;
			display: inline-block;
		}
		figcaption {
			margin-top: 2px;
			margin-left: 12px;
		}
        #user-photo {
			border-radius: 50%;
			border: 2px solid #404040;
		}
        @media (min-width: 768px) {
			#user-photo {
				height: 65px;
				width: 65px;
			}
		}
	</style>
    
</user-profile-photo>
