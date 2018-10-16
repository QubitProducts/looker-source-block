# Welcome
Qubit is the fastest and most scalable personalization platform available today. The highly granular low-latency behavioral data we collect is available for analysis and export using Qubit Live Tap.

# Release notes

**October 2018 - Release v2.0**
- This block has been updated to work with Live Tap V2, which uses BigQuery StandardSQL & date partitioning for enhanced performance.
- If you are looking for the previous block (which made use of LegacySQL), this is available on the git branch _v1-legacy_. This update introduces breaking changes from V1.0. 
- Updated Segments LookML to enable a timestamp filter.
- Further updates and optimizations will be released soon.

# Why does this block offer?
For Qubit Live Tap customers, this block provides a template of an Explore for interacting directly with your data in Google BigQuery. 

This model joins presents your Qubit data as pre-defined subject areas, measures and dimensions — so you can get started quickly, using the Looker point-and-click functionality with minimal set-up.

![Live Tap on Looker](https://github.com/QubitProducts/looker-source-block/blob/master/qubit_livetap_looker_screenshot.png)

Benefits of this block:

* Focuses on columns and tables that are most relevant for reporting and analysis work.

* Combines data items from multiple underlying event tables into single views for segments, views, experiences, and other reporting entities.

* Bakes in best-practice joins and data access paths between these underlying tables to ensure efficient data access and avoid double-counting of event. 


# Requirements
- You have a Looker license
- You are using Live Tap V2, utilizing BigQuery StandardSQL & date partitioning
- You are using the _retail ecommerce_ data schema
- You are using the _retail ecommerce_ Live Tap data model

Contact your Qubit customer success manager if you are unsure on the above, or if you are a travel or egaming customer.

# Data Architecture

This model covers the common set of metrics & subject areas used in the Qubit platform. 

You are welcome to extend this model following the guide below, ensuring you are able to merge future releases of this block into your Looker set-up.

If a data point is not available in this model, you can always query the underlying events direct from the date pipeline as they arrive in real-time.

![Qubit Retail Live Tap Data Model](https://github.com/QubitProducts/looker-source-block/blob/master/retail_livetap_datamodel.jpeg)


# Setting up on your Looker instance

## Summary

1. Set up the connection to Google BigQuery in Looker for your hosted Live Tap dataset
2. Fork this GitHub repo
3. Clone the forked repo to your desktop and replace the demo project details with your organization’s, then commit changes
4. Set up and configure your Looker project to use this forked, customized Looker repo

## 1. Creating a Looker Connection to Your Qubit Live Tap Dataset

To connect your Looker instance to your Qubit Live Tap dataset you’ll need admin rights on your Looker instance, and you will need the following information that can be provided by your Qubit account manager:

* **Looker Connection Name**: e.g. client-connection-100000
* **Qubit Project Name**: e.g. qubit-client-10000
* **Qubit Tracking ID**: e.g. the name of the BigQuery dataset you wish to analyze in Looker
* **Service Account Name**: e.g. email address for a service account. This will start with qubit-client-bi@qubit-client
* **JSON key file**: JSON file containing authentication details.

Your JSON key file can also be downloaded from the Qubit app from the Settings>Auth Keys menu.

To configure the connection from your Looker instance to Qubit Live Tap on Google BigQuery go to the Admin panel in Looker, then select **Connections** and then **New Connection**, then enter the following details:

* **Name** - Looker Connection Name 
* **Dialect** - Google BigQuery (Standard SQL)
* **Project Name** - Qubit Project Name
* **Dataset** - Qubit Dataset  (the connection will work for all datasets in the project, not just the one specified) 
* **OAuth Credentials Email** - Service Account Name
* **OAuth Credentials JSON/P12 File** - upload JSON key file
* **Max Billing Tier** - 1 


Select **Test These Settings** to ensure the setup works, then press **Save**.

The remaining connection settings can be left in their default state.

## 2. Forking the Qubit Source Block

Now you can fork the Qubit demo Looker repo so you have a copy in your own private Github repository.

1. On GitHub, navigate to the QubitProducts/looker-source-block repository.
2. In the top-right corner of the page, click **Fork**.
3. On GitHub, navigate to your fork of the QubitProducts/looker-source-block repository.
4. Under the repository name, click **Clone or download**.
5. In the **Clone with HTTPS** section, click  to copy the clone URL for the repository.
6. Open the Mac OS X or Linux terminal application (or use PuTTy if on Microsoft Windows).
7. At the terminal type `git clone` and then paste the URL you copied in Step 5. It will look like this, with your GitHub username instead of YOUR-USERNAME:

```bash
git clone https://github.com/YOUR-USERNAME/QubitProducts/looker-source-block
```

## 3. Customizing the Qubit Source Block with Client-Specific Live Tap datasets

Now at the terminal run the following commands to replace all occurrences of our demo ID (_qshopdemo_) and project ID in the repo LookML files with your own values:

```bash
# replace qshopdemo placeholder with our actual TRACKING_ID in all files
find . -type f -print0 | xargs -0 perl -pi -e ‘s/qshopdemo/TRACKING_ID/g’

# replace project ID placeholder with our actual PROJECT_ID in all files
find . -type f -print0 | xargs -0 perl -pi -e ‘s/37403/PROJECT_ID/g’

# relabel our LookML filenames to our actual tracking ID
for f in *.l*; do mv $f ${f/qshopdemo/TRACKING_ID}; done
```

for example, for the tracking ID “shipping_global” and project ID "12345" you would run the commands:

```bash
find . -type f -print0 | xargs -0 perl -pi -e ‘s/qshopdemo/shipping_global/g’
find . -type f -print0 | xargs -0 perl -pi -e ‘s/37403/12345/g’
for f in *.l*; do mv $f ${f/qshopdemo/shipping_global}; done
```

Next, commit your changes back to the git repo.

```bash
git add .
git commit -m "added our tracking ID and project ID"
```

## 4. Creating the Looker Project

Before completing this final step, ensure that you have forked the GitHub repo and that you have repo URL.  You will also need appropriate permissions on Looker to set up projects.

1. Log into Looker as an admin user
2. Select **Develop** and then **Manage LookML Projects**
3. Scroll to the bottom of the page and select **New LookML Project**
4. Type in a name for your project. We recommend using the same project same name as the GitHub repo holding your files
5. Select **Generate Model & Views and Save**. You’ll then be taken to the project page
6. Select **Configure Git**. Type-in the URL of your Github repo, then select **Continue**
7. Looker will now issue a deploy key.  Select the full content content of the key and copy it to your clipboard
8. Navigate to your repo in GitHub and select **Settings**
9. In the page that’s then displayed, select **Deploy Keys** and **Add Deploy Key**
10. Enter a title for the deploy key and paste the deploy key given by Looker
11. When prompted, Select **Allow write access** and **Add key**
12. Return to  Looker and on the page showing the deploy key, select **Continue Setup**
13. Looker will now attempt to sync with GitHub repo
14. Select **Sync Development Mode**

If successful, the response will be **Up to date with Production**.  This means that  all permissioned users should be able to see the Live Tap model on your Looker instance.

# Extending this block with additional fields, views and datasets
This block is provided to help you get started and is designed to be amended, extended, or customized by customers or Qubit partners. 

You may wish to add an extra calculated column of data, or integrate datasets you have uploaded into the Qubit platform.

For more information on extending this block, see the [Live Tap documentation](https://docs.qubit.com/content/using-qubit/vcdx-live-tap-extending-customizing).


## Be ready for future updates to this block
Qubit may upgrade the contents of this block and extend it with new fields and views. In order to make incorporating these updates into your Looker instance easy, ensure any customizations are saved in the files ending with v01 (not the 'base'), or in a new file. If you make changes to _base_ files and then merge in updates into your model your changes will be lost.


# Help & feedback
Blocks were designed for continuous improvement through the help of the entire Looker community, and we’d love your input. To log an error or recommendation, simply create an github issue. Please be as detailed as possible in your explanation, and we’ll address it as quick as we can.
