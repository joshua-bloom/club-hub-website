<application-page>

    <!-- PAGE ROUTING -->
    <application-page-form if={ subpage === "application-form"}/>
    <application-page-results if={ subpage === "application-results"}/>
    <page-not-found if={ subpage !== "application-form" && subpage !== "application-results"}/>

     <script>
        console.log('application-page.tag');
        var that = this;

        this.user = firebase.auth().currentUser;

        this.subpage = "application-form";             // When "application-page.tag" is initially mounted, display "application-page-form.tag"

		var subRoute = route.create();
				subRoute('application-page/*', function(subpage) {
					that.subpage = subpage;                           // subRoute works just like appRoute but is used so as not to interfere with the appRouting
					that.update();
				});                                                   // appRoute allows us to navigate between Home, Application, etc...
				subRoute('application-page', function(subpage){       // https://clubhub.com/#home or https://clubhub.com/#application-page
				  that.subpage = "application-form";
					that.update();                                    // whereas subRoute allows us to navigate between pages at a differ URL level :
				});                                                   // https://clubhub.com/#application-page/application-form
                                                                      // https://clubhub.com/#application-page/application-results
		this.on('mount', function(){
		  route.exec();
		});

		// Since this page is unmounted often, we need to STOP this subRoute
		// when we unmount application-page. Otherwise, the subroute still exists, listens,
		// and the next time we open up the survey page - things get weird.
		this.on('unmount', function() {
		  subRoute.stop();
		});

     </script>

     <style>
          :scope {
               display: block;
          }
     </style>

</application-page>
