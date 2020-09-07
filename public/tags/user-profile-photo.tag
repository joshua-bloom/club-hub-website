<user-profile-photo>
    
    <!-- Display user's profile photo -->
    <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#my-profile">
        <img id="user-photo" src={ userPhotoURL } alt="user profile photo" width="35px" height="35px">
        <!-- Display user's name -->
        <!--{ userName.substr(0,user.displayName.indexOf(' ')) }-->
    </a>

	<script>
		var that = this;
		this.user = firebase.auth().currentUser;

		this.userPhotoURL = "http://placehold.it/100x100.png";    // Default user photo set to placeholder
		this.userName = "First Last Name";

        if (this.user.photoURL) {						          // Get user profile photo from Google Account (if available)	  
            this.userPhotoURL = this.user.photoURL;			
        }
        if (this.user.displayName) {
            this.userName = this.user.displayName;                // Get user's name from Google Account and display it
        }
	</script>

	<style>
		* {
			-webkit-transition: .25s ease-in;
			transition: .25s ease-in;
		}
		:scope {
			display: inline-block;
            padding: none;
            margin: none;
		}
        
        a {
            margin-top: -2px;
        }
        
        #user-photo {
			border-radius: 50%;
			border: 2px solid #404040;
		}
	</style>
    
</user-profile-photo>
