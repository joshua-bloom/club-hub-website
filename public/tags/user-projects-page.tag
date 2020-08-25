<user-projects-page>

	<subpage-default if={ subpage === "default" && subpage !== "detailed-project"}/>			<!-- Mounting different project display subpages depending on the URL -->
	<subpage-search if={ subpage === "search"}/>
	<subpage-all-projects if={ subpage === "all-projects"}/>
	<subpage-in-progress if={ subpage === "in-progress-projects"}/>
	<subpage-detailed-project if={ subpage === "detailed-project"}/>
	<subpage-project-editor if={ subpage === "project-editor"}/>

	<p if={ !subpage }><strong>NO SUBPAGE</strong></p>

	<page-not-found if={ subpage !== "default" && subpage !== "search" && subpage !== "all-projects" && subpage !== "in-progress-projects"
					&& subpage !== "detailed-project" && subpage !== "project-editor" }/>

	<script>
		var that = this;
		// console.log('user-projects-page.tag');

		this.user = firebase.auth().currentUser;

		this.subpage = "default";

		var subRoute = route.create();
				subRoute('my-projects/*', function(subpage) {
					console.log(subpage);
					that.subpage = subpage;
					that.update();
				});
				subRoute('my-projects', function(subpage){
				  that.subpage = "default";
					that.update();
				});

		this.on('mount', function(){
		  route.exec();
		});

		// Since this my-projects page is unmounted often, you need to STOP this subRoute
		// when you unmount my-projects. Otherwise, the subroute still exists, listens,
		// and the next time you open up the my-projects page - things get weird.
		this.on('unmount', function() {
		  subRoute.stop();
		});

	</script>

	<style>
		:scope {
			display: block;
		}
	</style>
</user-projects-page>
