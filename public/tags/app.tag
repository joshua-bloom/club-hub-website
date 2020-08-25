<app>

    <!-- PAGE ROUTING : Depending on the URL, <app.tag> will look like:
		<navbar-top/>			<navbar-top/>			<navbar-top/>
		<home-page/>			<application-page/>     <user-profile/>
		<navbar-bottom/>		<navbar-bottom/>		<navbar-bottom/>     -->

    <!-- ALWAYS mount the top navigation bar, see "navbar-top.tag" for code  -->
	<navbar-top/>

    <!-- MOUNT ONE OF THE FOLLOWING RIOT TAGS INTO THE BODY OF THE PAGE
            https:/clubhub.com/#home
            https:/clubhub.com/#application-page
            https:/clubhub.com/#my-profile
    -->
	<home-page if={ page === "home"} class="body"/>
	<application-page if={ page === "application-page"} class="body"/>
	<user-profile if={ page === "my-profile"} class="body"/>
    <page-not-found if={ page !== "home" && page !== "application-page" && page !=="my-profile"} class="body"/>

    <!-- ALWAYS mount the bottom navigation bar, see "navbar-bottom.tag" for code -->
	<navbar-bottom/>

	<!-- JAVASCRIPT -->
	<script>
        console.log('in app.tag');

		var that = this;			                    // Note : THIS always points to the current tag instance
		this.page = "home"; 		                    // Set the default page for the website (i.e. the entry point to the app)

		var appRoute = route.create();                  // Specify routing for domain/website sub-pages
		appRoute('*/..', function(page, subpage) {	    // * wildcard represents page-a page-b page-c
			                 that.page = page;		    // .. wildcard represents anything that comes after
		                 }
        );
		appRoute('*', function(page) {
                	      that.page = page;
                		  that.update();
		              }
        );
		route.start(true);			                    // Riot router: always "listening" for changes to the URL so can route to the correct page
								                        // Note: routing to the correct page really just entails mounting the correct Riot tag (see above)
	</script>

	<!-- CSS -->
	<style>
		:scope {
			display: block;
		}

		@media (min-width: 300px) {		/*  Depending on the size (width) of the screen, the navbar will take up between 1 and 3 rows  */
			.body {					    /*  So this CSS code accounts for the varying size of the top navbar by pushing the HTML body  */
				margin-top: 300px;		/*  components further down on the page, so they appear BELOW the navbar				       */
			}
		}
		@media (min-width: 476px) {
			.body {
				margin-top: 215px;
			}
		}
		@media (min-width: 967px) {
			.body {
				margin-top: 125px;
			}
		}

	</style>

</app>
