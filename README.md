# Welcome
Qubit is the fastest and most scalable personalization platform available today. The highly granular low-latency behavioral data we collect is available for analysis and export using Qubit Live Tap.

# Release notes

**March 2019 - Release v2.5**
- Updated `q_experience`* and `q_goal_achieved`* views to provide latest _Experience Name_
- Updated `q_experience`* and `q_goal_achieved`* views to fix a rare issue where _Experience Status_ was calculated incorrectly
- Fixed column type bug that was preventing `q_goal_achieved.days_experience_live` from calculating

**December 2018 - Release v2.3**
- Add site filter to enable easy switching between separate projects
- Use a single date filter to easily filter all views in the Explore
- Includes latest fixes

**October 2018 - Release v2.0**
- This block has been updated to work with Live Tap V2, which uses BigQuery StandardSQL & date partitioning for enhanced performance
    - If you are looking for the previous block (which made use of LegacySQL), this is available on the git branch _v1-legacy_. This    update introduces breaking changes from V1.0. 
- Updated Segments LookML to enable a timestamp filter
- Further updates and optimizations will be released soon

# What does this block offer?
For Qubit Live Tap customers, this block provides a template of an Explore for interacting directly with your data in Google BigQuery. 

This model presents your Qubit data as pre-defined subject areas, measures, and dimensions — so you can get started quickly, using the Looker point-and-click functionality with minimal set-up.

![Live Tap on Looker](https://github.com/QubitProducts/looker-source-block/blob/master/qubit_livetap_looker_screenshot.png)

Benefits of this block:

* Focuses on columns and tables that are most relevant for reporting and analysis work
* Combines data items from multiple underlying event tables into single views for segments, views, experiences, and other reporting entities
* Bakes in best-practice joins and data access paths between these underlying tables to ensure efficient data access and avoid double-counting of event


# Requirements
- Looker license
- Live Tap V2, utilizing BigQuery StandardSQL & date partitioning
- _retail ecommerce_ data schema
- _retail ecommerce_ Live Tap data model

Contact your Customer Success Manager at Qubit if you have any questions regarding these requirements , or if you are a travel or eGaming customer.

# Data architecture

This model covers the common set of metrics and subject areas used in the Qubit platform. 

You are welcome to extend this model following the guide below, being mindful that you may need to merge future releases of this block into your Looker set-up.

If a data point is not available in this model, you can always query the underlying events directly from the date pipeline as they arrive in real time.

![Qubit Retail Live Tap Data Model](https://github.com/QubitProducts/looker-source-block/blob/master/retail_livetap_datamodel.jpeg)


# Setting up on your Looker instance

## Summary

1. Set up a connection in Looker to Google BigQuery StandardSQL for your Qubit datasets
2. Fork this GitHub repo
3. Clone the forked repo to your desktop and replace the demo project details with those of your organization
4. Set up and configure a new Looker project to use this new customized Looker repo
5. Grant access to your Looker users

## Step 1 - Creating a Looker connection to your Qubit Live Tap dataset

To connect your Looker instance to your Qubit Live Tap dataset you’ll need admin rights on your Looker instance, and you will need the following information that can be provided by your Qubit account manager:

* **Looker Connection Name** - e.g. `qubit-livetap`
* **Qubit Project Name** - e.g. `qubit-client-12345`
* **Qubit Tracking Id**
* **Service Account Name** - e.g. email address for a service account. This will start with `qubit-client-bi@qubit-client`
* **JSON key file** - JSON file containing authentication details

**NOTE**: Your JSON key file can be downloaded from the Qubit app from *Settings* > *Auth keys* menu if not already provided.

To configure the connection from your Looker instance to Qubit Live Tap on Google BigQuery go to the Admin panel in Looker, then select **Connections** and then **New Connection**, then enter the following details:

* **Name** - Create a Looker connection name.  This name must match the `connection` defined on line 1 of `model.model.lkml`
* **Dialect** - `Google BigQuery (Standard SQL)`
* **Project Name** - Qubit Project Name, e.g. `qubit-client-12345`
* **Dataset** - Qubit Dataset, e.g. `mysite__v2`.  The connection will work for all datasets in the project, not just the one specified
* **OAuth Credentials Email** - Email address for your service account
* **OAuth Credentials JSON/P12 File** - Upload the JSON key file for access
* **Persistent Derived Tables (PDTs)** - ✔
* **Temp Dataset** - Scratch dataset for Looker to create PDTs in.  Default is `qubit_bi_cs_cache`

Select **Test These Settings** to ensure the setup works, then press **Save**.

**NOTE**: The remaining connection settings can be left in their default state.

## Step 2 - Forking the Qubit source block

You can now fork the Qubit demo Looker repo so you have a copy in your own private Github repository.

1. In GitHub, navigate to the QubitProducts/looker-source-block repository
2. In the top-right corner of the page, select **Fork**
3. In GitHub, navigate to your fork of the QubitProducts/looker-source-block repository
4. Under the repository name, select **Clone or download**
5. In the **Clone with HTTPS** section, select  to copy the clone URL for the repository
6. Open the Mac OS X or Linux terminal application (or use PuTTy if on Microsoft Windows)
7. At the terminal enter `git clone` and then paste the URL you copied in Step 5. It will look like this, with your GitHub username instead of YOUR-USERNAME:

```bash
git clone https://github.com/YOUR-USERNAME/QubitProducts/looker-source-block
```

## 3. Customizing the Qubit source block for your Qubit dataset

This block uses parameters to inject your Qubit project Id and tracking Ids into the SQL, enabling you to switch between websites
using a simple filter. These are found in `q_view_v01.view.lkml`.

Firstly, update `project` with your BigQuery project Id:

```js
parameter: project {
    type: unquoted
    default_value: "12345"
    hidden: yes
}
```

Next, complete the `site` parameter with each tracking Id you wish to use:

```js
parameter: site {
    type: unquoted
    allowed_value: {
        label: "USA"
        value: "store_us"
    }
    allowed_value: {
        label: "UK"
        value: "store_uk"
    }
    ...
}
```

**NOTE**: The default choice for `site` is defined in `model_v01.model.lkml`.

If you wish to use multiple entirely separate models in the same git repository, you should find and replace the `q_` placeholder across this block with a unique identifier for each model.

Finally, commit your changes back to the git repo:

```bash
git add .
git commit -m "added our tracking ID and project ID"
```

## 4. Creating the Looker Project

Before completing this final step, ensure that you have forked the GitHub repo and that you have the repo URL.  You will also need appropriate permissions on Looker to set up projects.

1. Log into Looker as an admin user
2. Select **Develop** and then **Manage LookML Projects**
3. Scroll to the bottom of the page and select **New LookML Project**
4. Type in a name for your project. We recommend using the same project same name as the GitHub repo holding your files
5. Select **Generate Model & Views and Save**. You’ll then be taken to the project page
6. Select **Configure Git**. Paste in the SSH URL of your Github repo, e.g. `git@github.com:organisation/repo.git`, then select **Continue**
7. Looker will create a deploy key.  Copy this.
8. Navigate to your repo in GitHub and select **Settings**
9. In the resulting page, select **Deploy Keys** and **Add Deploy Key**
10. Enter a title for the deploy key and paste the deploy key
11. When prompted, Select **Allow write access** and **Add key**
12. Return to  Looker and on the page showing the deploy key, select **Continue Setup**

Looker will now attempt to sync with GitHub repo.

If successful, you should be able to **Pull** the LookML into your development branch and see the LookML from this block. You can then:

- Deploy to production, enabling Looker users to use the Explore
- Set up various permissions in the Looker admin console to grant/restrict access to various groups of users on your Looker instance

# Extending this block with additional fields, views and datasets
This block is provided to help you get started and is designed to be amended, extended, or customized by customers or Qubit partners. 

You may wish to add an extra calculated column of data, or integrate datasets you have uploaded into the Qubit platform.

For more information on extending this block, see the [Live Tap documentation](https://docs.qubit.com/content/using-qubit/vcdx-live-tap-extending-customizing).


## Be ready for future updates to this block
Qubit may upgrade the contents of this block and extend it with new fields and views. To make incorporating these updates into your Looker instance easy, ensure any customizations are saved in the files ending with v01, not the 'base', or in a new file. If you make changes to the base files, and then merge in updates into your model, your changes will be lost.


# Help & feedback
Blocks were designed for continuous improvement through the help of the entire Looker community, and we’d love your input. To log an error or recommendation, simply create an github issue. Please be as detailed as possible in your explanation, and we’ll address it as quick as we can.
