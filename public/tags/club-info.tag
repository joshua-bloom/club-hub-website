<club-info>
    <!-------------------------------------------------------------------------------------------------------------------------->
    <!------------------------------------------------------ Club Listings ----------------------------------------------------->
    <!-------------------------------------------------------------------------------------------------------------------------->

    <!-- HTML -->
    
    <!-- Club Listings Page Heading-->
    <h2 class="page-section-heading text-center text-uppercase text-secondary mt-5 pt-5 mb-0">Club Listings</h2>
    <!-- Icon Divider-->
    <div class="divider-custom my-0 pt-0 pb-4">
        <div class="divider-custom-line"></div>
        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
        <div class="divider-custom-line"></div>
    </div>
    
    <!-- Club Listings Page Content-->
    <div class="container mb-5" id="accordion">
        
        <!-- Make first card invisible (if nothing is in database or data doesn't load, website will crash) -->
        <div class="card" style="display:none;"></div>
        
        <!-- Create thumbnail for each club and populate with club info (name, description, leaders, etc.) -->
        <div class="card mb-2" each={ schoolClubs }>
            <div class="card-header" id="headingOne">
                <h5 class="mb-0">
                    <button class="btn btn-link collapsed" data-toggle="collapse" data-target={ '#'+id } aria-expanded="true" aria-controls={ id }>
                      { applicationResponses.clubName }
                    </button>
                </h5>
                <p class="font-weight-light ml-3">{ applicationResponses.clubDivision }</p>
            </div>
            <div id={ id } class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
                <div class="card-body"> 
                    <div class="row">
                        <div class="col-4">
                            <div class="list-group" id="list-tab" role="tablist"> 
                                <button class="list-group-item list-group-item-action active" data-toggle="list" data-target={ "#list-overview-"+id } role="tab" aria-controls="overview" id="list-overview-list">Club Overview</button>
                                <button if={ user} class="list-group-item list-group-item-action" data-toggle="list" data-target={ "#list-meeting-"+id } role="tab" aria-controls="meeting" id="list-meeting-list">Meeting Info</button>
                                <button if={ user}  class="list-group-item list-group-item-action" data-toggle="list" data-target={ "#list-leaders-"+id } role="tab" aria-controls="leaders" id="list-leaders-list">Club Leaders</button>
                                <button class="list-group-item list-group-item-action" data-toggle="list" data-target={ "#list-sponsor-"+id } role="tab" aria-controls="sponsor" id="list-sponsor-list">Faculty Sponsor</button>
                            </div>
                        </div>
                        <div class="col-8">
                            <div class="tab-content" id="nav-tabContent">
                                <!-- Club Overview/Description -->
                                <div class="tab-pane fade show active" id={ "list-overview-"+id } role="tabpanel" aria-labelledby="list-overview-list">
                                    <strong>Overview</strong>                       <!-- PUBLIC DATA: club description (visible to world) -->
                                    <p class="mt-3">{ applicationResponses.clubDescription }</p>
                                </div>
                                <!-- Club Meeting Info -->
                                <div class="tab-pane fade" id={ "list-meeting-"+id } role="tabpanel" aria-labelledby="list-meeting-list">
                                    <strong>Meetings</strong>                       <!-- PRIVATE DATA: meeting info (visible to Bishop's) -->
                                    <p class="mt-3">{ applicationResponses.meetingInfo }</p>
                                </div>
                                <!-- Student Leaders -->
                                <div class="tab-pane fade" id={ "list-leaders-"+id } role="tabpanel" aria-labelledby="list-leaders-list">
                                    <strong>Leaders</strong>                        <!-- PRIVATE DATA: club leaders (visible to Bishop's) -->
                                    <p class="mt-3">{ applicationResponses.clubLeaders.join(', ') }</p>
                                    <a if={ user } href={ 'mailto:' + applicationResponses.clubEmails.join(';') +
                                                          '?subject=' + applicationResponses.clubName + ' Inquiry'} target="_blank" >
                                        <i class="fa fa-2x fa-envelope-square" aria-hidden="true"></i></a>
                                    <!--------------------------------------------------------------------------------------------------------->
                                    <!--  To send email to ALL club leaders, separate email addresses with a semicolon                       -->
                                    <!--  EXAMPLE: 'mailto:joshua.bloom@bishops.com;marcus.jaiclin@bishops.com?subject=Request from website' -->
                                    <!--------------------------------------------------------------------------------------------------------->
                                </div>   
                                <!-- Faculty Sponsor -->
                                <div class="tab-pane fade" id={ "list-sponsor-"+id } role="tabpanel" aria-labelledby="list-sponsor-list">
                                    <strong class="mb-2">Faculty Sponsor </strong> 
                                    <p class="mt-3">{ applicationResponses.facultyName }</p>    <!-- PUBLIC DATA: faculty sponsor name (visible to world) -->
                                    <a if={ user } href={ 'mailto:' + applicationResponses.facultyEmail + '?subject=Request from Website'} target="_blank">
                                        <i class="fa fa-2x fa-envelope-square" aria-hidden="true"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
        

    <!-- JAVASCRIPT -->
	<script>
        console.log("club-info.tag");

		var that = this;

		this.schoolClubs = [];
		this.user = firebase.auth().currentUser;				// Get current user

		this.userID = "No ID";
		if (this.user && this.user.uid) {
			this.userID = this.user.uid;
		}

		// This reference is important - see database for architecture
		var database = firebase.database();
        var schoolClubssRef = database.ref('clubs/public');
        
		schoolClubssRef.on('value', function(snapshot) {
			var clubData = snapshot.val();
			if (clubData) {
				that.schoolClubs = Object.values(clubData);
			}
			else {
				that.schoolClubs = [];
			}
			that.update();
		});
        
        // Authentication listener
		firebase.auth().onAuthStateChanged(function(userObj) {
			that.user = firebase.auth().currentUser;
			that.update();
		});

		this.on('mount', function(event) {
			// what do you want to do when the Riot Tag is mounted?
		});

		// Removing event listeners
		this.on('unmount', function(event) {
		  schoolClubssRef.off('value');
		});
        
		this.on('unmounted', function(event) {
			console.log('unmounted');
		});

	</script>
   
    <!-- CSS -->
	<style>
		:scope {
			display: block;
		}
	</style>

</club-info>
