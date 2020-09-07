<application-page-form>
    <!-------------------------------------------------------------------------------------------------------------------------->
    <!---------------------------------------------------- Club Application ---------------------------------------------------->
    <!-------------------------------------------------------------------------------------------------------------------------->

     <!-- HTML -->
     <div class="container-fluid bg-white text-secondary mb-5">
         
         <!-- Application Page Heading-->
         <h2 class="page-section-heading text-center text-uppercase text-secondary mt-4 pt-3">Club Application</h2>
         <!-- Icon Divider-->
         <div class="divider-custom my-0 pt-0 pb-4">
             <div class="divider-custom-line"></div>
             <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
             <div class="divider-custom-line"></div>
         </div>
         
         <!-- Application Page Form--> 
         <div class="row" id="contact">
             <div class="col-lg-10 mx-auto">
                 
                <form id="contactForm" name="sentApplication" novalidate="novalidate">
                 
                    <!-- Club Name-->
                    <div class="form-group form-row ml-2">
                        <label class="col-sm-3 col-form-label" for="colFormLabel">Club Name</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" ref="clubName" placeholder="Robotics Club" required="required" data-validation-required-message="Please enter your club's name.">
                            <p class="help-block text-danger"></p>
                        </div>
                     </div>
                     <!-- Club Division-->
                     <div class="form-group form-row ml-2 pb-3">
                         <label class="col-sm-3 col-form-label" for="colFormLabel">Club Division</label>
                         <div class="col-sm-9">
                            <select name="division" class="form-control" ref="clubDivision" required="required" data-validation-required-message="Is this an upper school, middle school, or service learning club?">
                                <option value="" selected disabled>Division</option>
                                <option value="upper school">Upper School</option>
                                <option value="middle school">Middle School</option>
                                <option value="service learning">Service Learning</option>
                            </select>
                         </div>
                     </div>
                    <!-- Club Description -->
                    <div class="form-group form-row ml-2 pb-3">
                        <label class="col-sm-3 col-form-label" for="colFormLabel">Club Description</label>
                        <div class="col-sm-9">
                            <textarea class="form-control" ref="clubDescription" rows="4" cols="50" placeholder="Describe your club in 3-5 sentences" required="required" data-validation-required-message="Please enter a description of your club."></textarea>
                        </div>
                    </div>
                    <!-- Club Meetings -->
                    <div class="form-group form-row ml-2 pb-3">
                        <label class="col-sm-3 col-form-label" for="colFormLabel">Meeting Information</label>
                        <div class="col-sm-9">
                           <textarea class="form-control" ref="meetingInfo" rows="4" cols="50" placeholder="Tell us where and when the club meets (location, day, time)." required="required" data-validation-required-message="Please enter meeting information for your club."></textarea>
                        </div>
                    </div>

                    <!-- Club Leaders/Founders -->
                    <div class="form-group form-row ml-2">
                        <label class="col-sm-3 col-form-label" for="colFormLabel" >Club Leaders</label>
                        <div class="col-sm-9 form-row">
                            <div class="col-5">
                                <input type="text" class="form-control" ref="leaderName1" placeholder="Harry Potter" aria-describedby="nameHelp" required="required" data-validation-required-message="Please enter club leader's name.">
                                <small id="nameHelp" class="form-text text-muted ml-3">Name</small>
                            </div>
                            <div class="col-7">
                                <div class="form-group">
                                    <input type="email" class="form-control" ref="leaderEmail1" placeholder="harry.potter.22@bishops.com" aria-describedby="emailHelp" required="required" data-validation-required-message="Please enter club leader's email.">
                                    <small id="emailHelp" class="form-text text-muted ml-3">Email</small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group form-row ml-2">
                        <label class="col-sm-3 col-form-label" for="colFormLabel" ></label>
                        <div class="col-sm-9 form-row">
                            <div class="col-5">
                                <input type="text" class="form-control" ref="leaderName2" placeholder="Ronald Weasley" aria-describedby="nameHelp">
                                <small id="nameHelp" class="form-text text-muted ml-3">Name</small>
                            </div>
                            <div class="col-7">
                                <div class="form-group">
                                    <input type="email" class="form-control" ref="leaderEmail2" placeholder="ronald.weasley.22@bishops.com" aria-describedby="emailHelp">
                                    <small id="emailHelp" class="form-text text-muted ml-3">Email</small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Faculty Sponsor-->
                    <div class="form-group form-row ml-2 pt-3">
                        <label class="col-sm-3 col-form-label" for="colFormLabel">Faculty Sponsor</label>
                        <div class="col-sm-9 form-row">
                            <div class="col-5">
                                <input type="text" class="form-control" ref="facultyName" placeholder="Prof. McGonagall" aria-describedby="nameHelp" required="required" data-validation-required-message="Please enter faculty sponsor's name.">
                                <small id="nameHelp" class="form-text text-muted ml-3">Name</small>
                            </div>
                            <div class="col-7">
                                <input type="email" class="form-control" ref="facultyEmail" placeholder="minerva.mcgonagall@bishops.com" aria-describedby="emailHelp" required="required" data-validation-required-message="Please enter faculty sponsor's email.">
                                <small id="emailHelp" class="form-text text-muted ml-3">Email</small>
                            </div>
                        </div>
                    </div>
                    <!-- Submit Button-->
                    <div id="success"></div>
                    <div class="form-group form-row mt-5 pt-0 mb-0">
                        <label class="col-sm-3 col-form-label" for="colFormLabel"></label>
                        <div class="col-sm-9">                       
                            <a class="btn btn-primary btn-xl" id="sendMessageButton" type="button" 
                               href="#application-page/application-results" onclick={ saveSurveyData }>
                                Submit Application
                            </a>
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
                
                //var result = confirm("Are you sure you want to submit your club application? This action can't be undone.");
                //if (result) {
                
                var applicationForm = {
                    clubDescription: this.refs.clubDescription.value,
                    clubDivision: this.refs.clubDivision.value,
                    clubName: this.refs.clubName.value,
                    clubLeaders: [this.refs.leaderName1.value, this.refs.leaderName2.value],
                    clubEmails: [this.refs.leaderEmail1.value, this.refs.leaderEmail2.value],
                    facultyName: this.refs.facultyName.value,
                    facultyEmail: this.refs.facultyEmail.value,
                    meetingInfo: this.refs.meetingInfo.value
                };

                // Database locations where club application will be saved (current/client user, admin user, and public)
                var myClubsRef = database.ref('clubs/users/' + this.user.uid);
                var adminClubsRef = database.ref('clubs/users/' + "nisCMhX16tN7u0Bxobrz1CL2Q4T2");   // storing club in Admin account too
                var publicClubsRef = database.ref('clubs/public/');

                // Create a new unique key for this particular club proposal
                var key = myClubsRef.push().key;

                // Construct JSON object with application form data
                var newClub = {
                    id: key,
                    userID: this.user.uid,
                    userName: this.user.displayName,
                    userEmail: this.user.email,
                    submittedAt: firebase.database.ServerValue.TIMESTAMP,
                    approved: false,
                    applicationResponses: applicationForm
                };

                // Now push newClub object with all data to Firebase (save in user's folder)
                myClubsRef.child(key).set(newClub).then(function(result){
                    console.log(result);
                }).catch(function(error){
                    console.log(error.message);
                });

                 // Now push newClub object with all data to Firebase (save in admin's folder)
                adminClubsRef.child(key).set(newClub).then(function(result){
                    console.log(result);
                }).catch(function(error){
                    console.log(error.message);
                });

                // Now push newClub object with all data to Firebase (save in public folder for public-facing homepage)
                publicClubsRef.child(key).set(newClub).then(function(result){
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
            
            this.refs.clubDivision.value = "";
		    this.refs.clubDivision.focus();
            
            this.refs.clubDescription.value = "";
            this.refs.clubDescription.focus();
            
            this.refs.leaderName1.value = "";
            this.refs.leaderName1.focus();
            this.refs.leaderName2.value = "";
            this.refs.leaderName2.focus();
            
            this.refs.leaderEmail1.value = "";
            this.refs.leaderEmail1.focus();
            this.refs.leaderEmail2.value = "";
            this.refs.leaderEmail2.focus();
            
            this.refs.facultyName.value = "";
            this.refs.facultyName.focus();
            this.refs.facultyEmail.value = "";
            this.refs.facultyEmail.focus();
            
            this.refs.meetingInfo.value = "";
            this.refs.meetingInfo.focus();
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
        /* highlight active (focused) textbox in Bishop's maroon */
        .form-control:focus {
            border-color: #872031;
            -webkit-box-shadow: none;
            box-shadow: none;
        }
	</style>

</application-page-form>
