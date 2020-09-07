<navbar>    
    <!-------------------------------------------------------------------------------------------------------------------------->
    <!----------------------------------------------------- Navigation Bar ----------------------------------------------------->
    <!-------------------------------------------------------------------------------------------------------------------------->
    
	<!-- HTML Code -->
    <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">

        <!-- IF "user" Object exists (i.e. a Bishop's user is logged in), then display this DIV and its contents -->
        <div if={ user } class="container">
            <a class="navbar-brand js-scroll-trigger" href="#home">
                <img src="assets/img/TBS_Logo.png"  width="75px" height="42px" alt=""/>ClubHub</a> <!-- Mobile Devices-->
            <button class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">Menu <i class="fas fa-bars"></i></button>

            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item mx-0 mx-lg-1">
                        <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#home">Home</a>
                    </li>
                    <li class="nav-item mx-0 mx-lg-1">
                        <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#application-page">Apply</a>
                    </li>
                    <li class="nav-item mx-0 mx-lg-1">
                        <user-profile-photo if={ !mobileDevice && user } />
                        <a if={ mobileDevice } class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#my-profile">Profile</a>
                    </li>
                    <li class="nav-item mx-0 mx-lg-1">
                        <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#home" onclick={ logOut }>Sign out</a>
                    </li>
                </ul>
            </div>
        </div>

        <!-- IF no one is signed in to the app, then display this DIV (a much more basic navbar) -->
        <div if={ !user } class="container">
            <a class="navbar-brand js-scroll-trigger" href="#home">
                <img src="assets/img/TBS_Logo.png"  width="75px" height="42px" alt=""/>ClubHub</a> <!-- Mobile Devices-->
            <button class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">Menu <i class="fas fa-bars"></i></button>

            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item mx-0 mx-lg-1">
                        <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#home">Home</a>
                    </li>
                    <li class="nav-item mx-0 mx-lg-1">
                        <!-- When sign-in button is clicked, the logIn() function will be called -->
                        <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#home" onclick={ logIn }>Sign in</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

	<!-- JavaScript Code -->
	<script>
        console.log("navbar.tag");
        
		var that = this;
        
        // What do you want to do when the Riot Tag is mounted?
        this.on('mount', function(event) {
            // Check the pixel-width of the device to determine how/what to display in the navbar
            this.mobileDevice = false;
            if (window.innerWidth <= 991) {
                this.mobileDevice = true;
            }
            that.update();
		});

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
            
            MORE INFO HERE:
                - https://firebase.google.com/docs/auth/web/google-signin
                - https://developers.google.com/identity/protocols/oauth2/openid-connect#obtainuserinfo
                - https://firebase.google.com/docs/reference/security/database
		-------------------------------------------------- */
        
		this.user = firebase.auth().currentUser;

        // AUTHENTICATION SIGN IN
		logIn(event) {
			// Specify that you want to sign up with Google authentication
			var provider = new firebase.auth.GoogleAuthProvider();
            
            // Optional: To localize the provider's OAuth flow to the user's preferred language without explicitly passing the
            // relevant custom OAuth parameters, update the language code on the Auth instance before starting the OAuth flow.
            // To apply the default browser preference instead of explicitly setting it: 
            firebase.auth().useDeviceLanguage();
            
            // Optional: Specify additional custom OAuth provider parameters that you want to send with the OAuth request. 
            // To add a custom parameter, call setCustomParameters on the initialized provider with an object containing the 
            // key as specified by the OAuth provider documentation and the corresponding value. More info can be found here:
            //    - https://developers.google.com/identity/protocols/oauth2/openid-connect#authenticationuriparameters
            provider.setCustomParameters({
              'login_hint': 'first.last.22@bishops.com',
              'prompt': 'select_account'
            });

            // Authenticate with Firebase using the Google provider object. 
            // Popover signup is probably the most simple and trusted. You can prompt your users to sign in with their Google 
            // Accounts either by opening a pop-up window or by redirecting to the sign-in page.
            // The pop-up window is preferred for desktop/laptop devices and the redirect method is preferred for mobile devices.
            firebase.auth().signInWithPopup(provider).then(function(result) {
                // This gives you a Google Access Token. You can use it to access the Google API.
                var token = result.credential.accessToken;
                var id_token = result.credential.idToken;
              
                // The signed-in user info.
                var user = result.user;
                console.log("User signed in:", user);
            }).catch(function(error) {
                // This catch function will provide an error message when signin isn't successful. 
                // You can look up tutorials for Google Auth to provide more sophisticated error messages.
                
                // Handle Errors here.
                var errorCode = error.code;
                var errorMessage = error.message;
                console.log("There was an error:", error.message);
                
                // The email of the user's account used.
                var email = error.email;
                console.log("User tried to sign-in with the email address", email," which is outside of the Bishop's org.");
                
                // The firebase.auth.AuthCredential type that was used.
                var credential = error.credential;
                // ...
            });
		}

		// AUTHENTICATION LISTENER
		// Once we code this, we have a "live" listener that is constantly listening for whether
		// the user is logged in or not. It will fire the callback if it "hears" a login, or logout.
		firebase.auth().onAuthStateChanged(function(userObj) {
           
            // If user is in the process of logging in, get their email address and slice off everything except for the last 11 characters.  
            // If the remaining 11 chars are equal to 'bishops.com', then the user has a Bishop's account and is permitted to sign in.
            // Otherwise, force user to sign out of Google to limit their access to the public-facing page of the website.
            if (firebase.auth().currentUser) {
                var userEmail = firebase.auth().currentUser.email;    
                var numCharacters = userEmail.length;
                var stop = numCharacters;
                var start = stop - 11;
                var userOrg = userEmail.substring(start, stop);
                console.log("Email:", userEmail, "   Organization:", userOrg);
                if (userOrg != "bishops.com") {
                    that.bishops = false;
                    console.log("WARNING! Non-Bishops user is trying to sign in. Terminate sign-in!");
                    firebase.auth().signOut();
                    console.log("Non-Bishops user has been signed out.")
                }
            }
			that.user = firebase.auth().currentUser;
			that.update();
		});
        
        // AUTHENTICATION SIGN OUT
		logOut(event) {
			firebase.auth().signOut();
			console.log("logout event = ", event);
		}
	</script>

	<!-- CSS -->
	<style>
        /* CSS styling code for navigation bar can be found in 'styles.css' */
	</style>

</navbar>