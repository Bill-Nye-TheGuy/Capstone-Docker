This repository contains the necessary files to recreate the Accent Identifying GCR website.

Necessary downloads:
	Google Cloud SDK
	Python and libraries in requirements.txt (optional)

Steps to rebuild:
	1.Clone the repository.
	2.Create free accounts on Google Cloud and setup a new project with all defaults.
	3.Install Google Cloud SDK
	4.Run 'gcloud init'
		1. Select your project
		2. Determine your server location
	5.CD into folder containing the cloned repository
	6.Run "gcloud run deploy"
	7.No options are neccesary, just hit enter.
		1. Must enable the API!!
	8.Wait for the deploy to finish it will output the URL to navigate to the website.
Optional:
	Use your favorite python editor to alter or test the website.
	To run the website locally run CD in to the repository and use CMD to input "streamlit run "