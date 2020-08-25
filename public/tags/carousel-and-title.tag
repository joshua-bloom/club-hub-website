<carousel-and-title>

    <!-- HTML -->
	<div class="container-fluid">
        <div class="row">
            <img src="assets/img/carousel-and-title.png" width="70%" height="70%">
        </div>
	</div>

    <!-- JAVASCRIPT -->
	<script>
        console.log("club-info.tag");

		var that = this;

		this.schoolClubs = [];
		this.user = firebase.auth().currentUser;				// Get current user

		this.userID = "No ID";
		if (this.user && this.user.uid) {
			this.userID = this.user.uid;
		}

		// This reference is important - see database for architecture
		var database = firebase.database();

        //var userClubsRef = database.ref('projects/users/' + this.userID);
        var schoolClubssRef = database.ref('projects/public');

		schoolClubssRef.on('value', function(snapshot) {
			var clubData = snapshot.val();
			if (clubData) {
				that.schoolClubs = Object.values(clubData);
			}
			else {
				that.schoolClubs = [];
			}
			that.update();
		});

		this.on('mount', function(event) {
			// what do you want to do when the Riot Tag is mounted?
		});

		// Removing event listeners
		this.on('unmount', function(event) {
		  schoolClubssRef.off('value');
		});
		this.on('unmounted', function(event) {
			console.log('unmounted');
		});

	</script>

    <!-- CSS -->
	<style>
		:scope {
			display: block;
		}
		.thumbnail {
			border: 1px solid black;
		}
		.thumbnail:hover {
			background-color: #e5e5e5;
		}
		.header {
			padding: none;
			padding-left: 5px;
		}
        .caption {
            margin-top: -25px;
            margin-left: 20px;
        }
	</style>

</carousel-and-title>
