<application-page-results>

    <!-- HTML -->
    <div class="container-fluid">
        <div class="row">
            <br><br>
            <h2>CLUB APPLICATION SUBMITTED</h2>
            <br><br>
        </div>
	</div>

    <!-- JAVASCRIPT -->
    <script>
        console.log('application-page-results.tag');
        var that = this;
        this.user = firebase.auth().currentUser;
    </script>

    <!-- CSS -->
    <style>
        :scope {
           display: block;
           background-color: white;
        }
        h3 {
           color: grey;
        }
        hr {
           border: 0.5px solid teal;
        }
    </style>

</application-page-results>
