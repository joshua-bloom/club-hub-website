<application-page-results>

    <!-- HTML -->
    <div class="container-fluid pt-3 mb-5 ">
        
        <div class="container d-flex align-items-center flex-column">
            <!-- Club Listings Page Heading-->
            <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Confirmation Page</h2>
            <!-- Icon Divider-->
            <div class="divider-custom my-0 pt-0 pb-4">
                <div class="divider-custom-line"></div>
                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                <div class="divider-custom-line"></div>
            </div>
            <!-- Masthead Subheading-->
            <h6 class="masthead-subheading text-center font-weight-light">Your club application has been submitted!</h6>
        </div>
	</div>

    <!-- JavaScript -->
    <script>
        console.log('application-page-results.tag');
        var that = this;
        this.user = firebase.auth().currentUser;
    </script>

    <!-- CSS -->
    <style>
        /* insert CSS code here */
    </style>

</application-page-results>
