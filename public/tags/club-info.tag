<club-info>

    <!-- HTML -->
	<div class="container-fluid">

        <!-- create thumbnail for each club and populate with club information (name, description, leaders, meeting time, meeting location) -->
		<div class="row thumbnail" each={ schoolClubs }>
            <!-- PUBLIC DATA: club name and description (visible to the world) -->
			<h2 class="header">{ surveyResponses.clubName }</h2><br>
			<div class="caption">
				<div class="row">
                    <h4>Description : <em>{ surveyResponses.clubDescription }</em></h4>
                </div>
                <!-- PRIVATE DATA: only display club leaders if Bishop's user is logged in -->
                <div class="row" if={ user }>
                    <h4>Leaders : <em>{ surveyResponses.clubLeaders }</em></h4>
                </div>
			</div>
		</div>

        <div class="row">
            <img src="assets/img/upper-school-clubs.png" width="50%" height="50%">
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

</club-info>
