<user-profile>

    <!-- HTML -->
	<div class="container-fluid">

        <!-- The "My Profile" page displays basic information about the user -->

		<!-- Header -->
		<div class="row">
			<div class="col-lg-8 col-md-8 col-sm-7 col-xs-7">
				<h2><i class="fa fa-address-card icon-header" aria-hidden="true"></i>My Profile</h2>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-4 col-xs-3">
				<img id="user-photo" src={ userPhotoURL } height="115px" width="115px">
			</div>
			<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"/>
        </div>

		<!-- Body -->
        <div class="container">
			<div id="user-info-headers" class="row">
				<h4>Name: <h5><em>{ userName }</em></h5></h4>
            </div>
            <div id="user-info-headers" class="row">
				<h4>Email: <em><h5> { userEmail } </h5></em></h4>
			</div>
        </div>
	</div>

    <!-- JAVASCRIPT -->
	<script>
        console.log("user-profile.tag");

		var that = this;

		this.userPhotoURL = "http://placehold.it/100x100";		// Default user photo to placeholder
		this.userName = "First Last Name";
		this.userEmail = "No Email";
		this.userID = "No ID";

		this.user = firebase.auth().currentUser;				// Get current user
        // console.log(this.user)                               // Uncomment to see all of the Google user data -->

		if (this.user.photoURL) {							    // If they have a (Google) photo...
			this.userPhotoURL = this.user.photoURL;				// display their photo instead of the placeholder
		}
		if (this.user.displayName) {
			this.userName = this.user.displayName;
		}
		if (this.user.email) {
			this.userEmail = this.user.email;
		}
		if (this.user.uid) {
			this.userID = this.user.uid;
		}
	</script>

    <!-- CSS -->
	<style>
		:scope {
			display: block;
			border: 1px solid #DDD;
			border-radius: 4px;
			padding: 15px;
			background-color: white;
		}
		.icon-header {
			padding-right: 25px;
		}
        #user-info-headers {
            margin-left: 15px;
        }
		@media (min-width: 768px) {
			#user-photo {
				height: 120px;
				width: 120px;
			}
		}
	</style>
    
</user-profile>
