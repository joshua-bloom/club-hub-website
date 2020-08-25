<navbar-top>
	<!-- HTML Code -->
	<div class="container-fluid">
		<nav class="navbar navbar-fixed-top">

			<!-- IF "user" Object exists (i.e. the user is logged in), then display this DIV and its contents -->
			<div if={ user } class="row">
				<ul>
                    <li class="pull-left">
						<a href="#home" id="app-logo">
                            <img src="assets/img/TBS_Logo.png"  width="150px" height="85px" alt=""/>
                            <img src="assets/img/clubhub_logo.jpg"  width="250px" height="54px" alt=""/>
						</a>
					</li>
					<!-- It will mount a different Riot tag in the body of the page IF the subpage URL is a match -->
					<li class="pull-right">
                        <a href="#application-page">
							<button class="btn btn-lg btn-default">
								<h3><i class="fa fa-lg fa-wpforms" aria-hidden="true"></i> APPLY</h3>
							</button>
						</a>
						<a href="#home" class="logout-button" >
                            <user-profile-photo/>	<!-- Mount the "user-profile-photo.tag" component -->
							<button id="logout-button" class="btn btn-md btn-danger" onclick={ logOut }>
								<h3>LOGOUT</h3>
							</button>
						</a>
					</li>
				</ul>
			</div>

			<!-- IF the user is NOT logged in, then display this DIV (a much more basic navbar) -->
			<div if={ !user } class="row">
				<ul>
                    <li class="pull-left">
                        <a href="#home" id="app-logo">
                            <img src="assets/img/TBS_Logo.png"  width="150px" height="85px" alt=""/>
                            <img src="assets/img/clubhub_logo.jpg"  width="250px" height="54px" alt=""/>
						</a>
					</li>
                    <li class="pull-right">
                        <a href="#home" class="login-button" >
                            <!-- When this button is clicked, the logIn() function is called (see below for details on how Google OAuth works) -->
                            <img id="google-signin" src="assets/img/google-signin-logo-dark.png" width="250px" height="60px" type="button" onclick={ logIn }>
						</a>
                    </li>
				</ul>
			</div>
		</nav>
	</div>

	<!-- JavaScript Code -->
	<script>
		var that = this;

        /* --------------------------------------------------
			AUTHENTICATION -> firebase.auth()
			1) onAuthStateChanged()
			2) signInWithPopup()
			3) signOut()

			ATOMIC WRITES
			1) ref.update(updateObject)
			2) See data architecture implications

			AUTHORIZATION
			1) Rules and cascades
			2) Keywords
				- auth
				- $something
				- data
				- newData
		-------------------------------------------------- */
		this.user = firebase.auth().currentUser;

		logIn(event) {
			// Specify that you want to sign up with Google authentication
			var provider = new firebase.auth.GoogleAuthProvider();

			// Popover signup is probably the most simple and trusted.
			// This catch function will provide an error message when signin isn't successful
			// Can look up tutorials for Google Auth to provide more sophisticated error messages.
			firebase.auth().signInWithPopup(provider).catch(function(error){
				console.log("There was an error:", error.message);
			});
		}

		// AUTHENTICATION LISTENER
		// Once we code this, we have a "live" listener that is constantly listening for whether
		// the user is logged in or not. It will fire the callback if it "hears" a login, or logout.
		firebase.auth().onAuthStateChanged(function(userObj) {
			that.user = firebase.auth().currentUser;
			that.update();
		});

		this.userPhotoURL = this.getPhotoURL;
		this.getPhotoURL = function() {
			if (this.user) {
				if (this.user.photoURL) { return this.user.photoURL; }
				else { return "http://placehold.it/100x100"; }
			}
			else {
				return "http://placehold.it/100x100";			// Default (placeholder) user photo
			}
		};

		logOut(event) {
			firebase.auth().signOut();
			// console.log("logout event = ", event);
		}
	</script>

	<!-- CSS Code -->
	<!-- Note: these styles ONLY apply to the top navigation bar -->
	<style>
		* {
			-webkit-transition: .25s ease-in;
			transition: .25s ease-in;
		}
		:scope {
			font-family: Mono;
		}
		nav div {
			background-color: white;
		}
		hr {
			color: black;
			background-color: black;
			border: 1px solid #222;
		}
		nav {
			text-align: center;
		}
		nav ul {
			//display: box;
			list-style: none;
			margin: 0 2px;
 			padding: 0px;
		}
		nav li {
			display: inline-block;
   			padding: 5px 5px;
		}
		nav a {
			text-decoration: none;
			font-weight: normal;
  			padding: 10px 5px;
  			font-size: .80em;
		}
		nav a:not(:last-child) {
			//margin-right: 1px;
		}
		nav a:hover {
			text-decoration: none;
		}
        .pull-right {
            padding-top: 15px;
            padding-right: 50px;
        }
		#login-button {
			border: none;
		}
		#logout-button {
			border: none;
			opacity: .75;
            width: 125px;
            height: 65px;
		}
		#logout-button:hover {
			opacity: 1;
			background-color: none;
		}
		.btn-default {
			border: none;
		}

		@media (max-width: 768px) {
			#google-signin {
				height: 60px;
				width: 250px;
			}
		}

	</style>

</navbar-top>
