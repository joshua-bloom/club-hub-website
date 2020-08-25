<home-page>

     <!-- HTML -->
	<div class="container-fluid">

        <!-- IF "user" Object does NOT exist (i.e. no user is logged in), then mount and display this Riot tag -->
        <home-page-public if={ !user }/>

        <!-- IF someone is logged in, then display this Riot tag instead -->
        <home-page-members if={ user }/>

     </div>

     <!-- JavaScript -->
     <script>
        console.log('home-page.tag');

        var that = this;
        this.user = firebase.auth().currentUser;

        // AUTHENTICATION LISTENER
		firebase.auth().onAuthStateChanged(function(userObj) {
			that.user = firebase.auth().currentUser;
			that.update();
		});
     </script>

     <!-- CSS -->
     <style>
          :scope {
               display: block;
          }
     </style>

</home-page>
