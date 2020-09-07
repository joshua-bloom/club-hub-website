<app>
    <!----------------------------------------------------------------------------------------------------------------------------->
    <!------------------------------------------------ Webpage Content + Routing -------------------------------------------------->
    <!----------------------------------------------------------------------------------------------------------------------------->
    
    <!-- Depending on the URL, <app.tag> will look like:        <navbar/>		 	<navbar/>			   <navbar/>
                                                                <home-page/>	    <application-page/>    <user-profile/>
                                                                <navbar-bottom/> 	<navbar-bottom/>	   <navbar-bottom/>      -->
    <!-- Header: top navigation bar is always mounted first-->
	<navbar/>
    
    <!-- Depending on the sub URL, mount one of three Riot tags into the body of the webpage-->
    <home-page if={ page === "home"} class="body"/>                        <!-- HOME PAGE: https:/clubhub.com/#home              --> 
	<application-page if={ page === "application-page"} class="body"/>     <!-- APPLY PAGE: https:/clubhub.com/#application-page -->
	<user-profile if={ page === "my-profile"} class="body"/>               <!-- PROFILE PAGE: https:/clubhub.com/#my-profile     -->
    <!-- If the sub URL is not recognized, display a 404 'Page Not Found' Error -->
    <page-not-found if={ page !== "home" && page !== "application-page" && page !=="my-profile"} class="body"/>
    
    <!-- Footer: bottom navigation bar is always mounted last-->
	<navbar-bottom/>

	<!-- JavaScript -->
	<script>
        console.log('app.tag');

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
        
        /*  
            Depending on the size (width) of the screen, the navbar will take up between 1 and 3 rows     
            So this CSS code accounts for the varying size of the top navbar by pushing the HTML body     
            components further down on the page, so they appear BELOW (and are not hidden by) the navbar  
        */
        @media (min-width: 300px) {		
			.container-fluid {					
				margin-top: 300px;		
			}
		}
		@media (min-width: 476px) {
			.container-fluid {
				margin-top: 150px;
			}
		}
		@media (min-width: 967px) {
			.container-fluid {
				margin-top: 175px;
			}
		}
	</style>

</app>
