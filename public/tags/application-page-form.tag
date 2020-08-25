<application-page-form>

     <!-- HTML -->
     <div class="container-fluid">

		<!-- Header -->
        <div class="row">
            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                <h2>Club Application</h2>
            </div>
            <div class="col-lg-2 col-lg-offset-2 col-md-3 col-md-offset-1 col-sm-3 col-sm-offset-1 col-xs-3 col-xs-offset-1">
                <button type="button" class="btn btn-lg btn-success">
                    <a href="#application-page/application-results" onclick={ saveSurveyData }>SUBMIT</a>
                </button>
            </div>
        </div>

		<!-- Body -->
		<div class="row">
               <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
     			<form>
     				<div class="row form-row">

     					<!-- Column 1 -->
     					<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12">
     						<div class="form-row row">
     							<div class="col-lg-5 col-md-5 col-sm-5 col-xs-6">
     								<label><h4>Club Name</h4></label>
     							</div>
     							<div class="col-lg-7 col-md-7 col-sm-7 col-xs-6">
     								<input type="text" class="form-control" ref="clubName" placeholder="Project Title">
     							</div>
     						</div>
                            <div class="form-row row">
     							<div class="col-lg-5 col-md-5 col-sm-5 col-xs-6">
     								<label><h4>Club Leaders</h4></label>
     							</div>
     							<div class="col-lg-7 col-md-7 col-sm-7 col-xs-6">
     								<input type="text" class="form-control" ref="clubLeaders" placeholder="{ user.displayName }">
     							</div>
     						</div>
     					</div>

     					<!-- Column 2 -->
                        <div class="form-group col-lg-offset-1 col-md-offset-1 col-lg-7 col-md-7 col-sm-12 col-xs-12">
                            <div class="form-row row">
                                <label><h4>Club Description</h4></label>
                                <textarea class="form-control" ref="clubDescription" rows="4" cols="50">[describe your club here]</textarea>
                            </div>
                        </div>

     				</div>
     			</form>
            </div>
		</div>
	</div>

    <!-- JAVASCRIPT -->
	<script>
        console.log("application-page-form.tag");
		var that = this;

        this.user = firebase.auth().currentUser;

        // This reference is important (see "Firebase Database Archicture.pdf" for more info)
        var database = firebase.database();

        // Save questions and responses from club application form
        saveSurveyData(event) {

            if (event.type === "click") {
                var applicationForm = {
                    clubName: this.refs.clubName.value,
                    clubLeaders: this.refs.clubLeaders.value,
                    clubDescription: this.refs.clubDescription.value,
                };

                // Database locations where club application should be saved (current user + public account)
                var myProjectsRef = database.ref('projects/users/' + this.user.uid);
                var publicProjectsRef = database.ref('projects/public');

                // Create a new unique key for this particular project proposal
                var key = myProjectsRef.push().key;

                // Construct JSON object with application form data
                var newProject = {
                    id: key,
                    userID: this.user.uid,
                    userName: this.user.displayName,
                    submittedAt: firebase.database.ServerValue.TIMESTAMP,
                    approved: false,
                    surveyResponses: applicationForm
                };
                console.log("application form data = ", newProject);

                // Now push newProject object with all data to Firebase (save in user's folder)
                myProjectsRef.child(key).set(newProject).then(function(result){
                    console.log(result);
                }).catch(function(error){
                    console.log(error.message);
                });

                // Now push newProject object with all data to Firebase (save in public folder for public-facing homepage)
                publicProjectsRef.child(key).set(newProject).then(function(result){
                     console.log(result);
                }).catch(function(error){
                     console.log(error.message);
                });

               this.reset();
           }
        }

        // Need to wipe these values after survey has been submitted so they won't be stored in the cache
        reset() {
		    this.refs.clubName.value = "";
		    this.refs.clubName.focus();
            this.refs.clubLeaders.value = "";
            this.refs.clubLeaders.focus();
            this.refs.clubDescription.value = "";
            this.refs.clubDescription.focus();
        }
	</script>

    <!-- CSS -->
	<style>
		:scope {
			display: block;
			border: 1px solid #DDD;
			border-radius: 4px;
			padding: 10px;
			background-color: white;
		}
        a {
            color: black;
        }
        a:hover {
            color: black;
        }
	</style>

</application-page-form>
