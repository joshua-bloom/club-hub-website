<home-page>
    <!-------------------------------------------------------------------------------------------------------------------------->
    <!-------------------------------------------------------- Home Page ------------------------------------------------------->
    <!-------------------------------------------------------------------------------------------------------------------------->
    
    <!-- HTML -->
    
    <!-- Notification banner displays when user tries to sign in with non-bishops google account -->
    <div if={ bishops == false } class="container pt-4">
        <div class="alert alert-warning alert-dismissible show" role="alert">
            <button type="button" class="close pull-right" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <div class="row">
                <div class="col-sm-12">
                    <p>This app is only accessible with a Bishop's Google account. Please try logging in again.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Masthead: School Logo and Website Title -->
    <header class="masthead bg-primary text-white text-center " >
        <div class="container d-flex align-items-center flex-column">
            <!-- Masthead Avatar Image-->
            <img class="masthead-avatar mb-5" src="assets/img/TBS_Logo.png" alt="" />
            <!-- Masthead Heading-->
            <h1 class="masthead-heading text-uppercase mb-0">ClubHub</h1>
            <!-- Icon Divider-->
            <div class="divider-custom divider-light">
                <div class="divider-custom-line"></div>
                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                <div class="divider-custom-line"></div>
            </div>
            <!-- Masthead Subheading-->
            <h6 class="masthead-subheading font-weight-light mb-2">The Bishop's School</h6>
        </div>
    </header>

    <!-- Club listings -->
    <club-info/>
    
    
     <!-- JavaScript -->
     <script>
         console.log('home-page.tag');
         
         var that = this;
         this.user = firebase.auth().currentUser;
         this.bishops = true;
         
         // AUTHENTICATION LISTENER
         firebase.auth().onAuthStateChanged(function(userObj) {
             that.user = firebase.auth().currentUser;
             
             if (firebase.auth().currentUser) {
                 var userEmail = firebase.auth().currentUser.email;    
                 var numCharacters = userEmail.length;
                 var stop = numCharacters;
                 var start = stop - 11;
                 var userOrg = userEmail.substring(start, stop);
                 if (userOrg != "bishops.com") {
                     that.bishops = false;
                 }
                 else {
                     that.bishops = true;
                 }
             }
             that.update();
         });
     </script>
    

     <!-- CSS -->
     <style>
         header {
            width: 100%; 
         } 
         
        .wrap:hover div:not(:hover) {
			-webkit-filter: grayscale(1);
			filter: grayscale(1);
			opacity: .75;
		}
     </style>

</home-page>