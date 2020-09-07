<user-profile>
    <!-------------------------------------------------------------------------------------------------------------------------->
    <!------------------------------------------------------- User Profile ----------------------------------------------------->
    <!-------------------------------------------------------------------------------------------------------------------------->
    
    <!-- HTML -->
	<div class="container-fluid mb-5">

        <!-- My Profile Page Heading-->
        <h2 class="page-section-heading text-center text-uppercase text-secondary mt-5 pt-5 mb-0">My Profile</h2>
        <!-- Icon Divider-->
        <div class="divider-custom my-0 pt-0 pb-4">
            <div class="divider-custom-line"></div>
            <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
            <div class="divider-custom-line"></div>
        </div>
        
        <!-- My Profile Page Body -->
        <div class="d-flex justify-content-center mt-2 pt-0 mb-0">
            <!-- Bootstrap 'Card' Component: https://getbootstrap.com/docs/4.0/components/card/ -->
            <div class="card" style="width: 18rem;">
                <img class="card-img-top" src={ userPhotoURL } id="user-photo" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">{ userName }</h5>
                    <p class="card-text">{ userEmail } &nbsp
                        <a if={ user } class="btn btn-primary py-1 px-2" href={ 'mailto:' + userEmail + '?subject=Request from Website'} target="_blank"><i class="fa fa-envelope-square" aria-hidden="true"></i></a>
                    </p>
                </div>
            </div>
        </div>
	</div>

    <!-- JavaScript -->
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
			background-color: white;
		}
	</style>
    
</user-profile>
