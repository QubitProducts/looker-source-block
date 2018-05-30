### **Who is this Looker Source Block for?**

Qubit provides Personalization software to implement individualization at scale. We collect and ingest highly granular, low-latency behavioral, quantitative and qualitative data to make this possible, making that data available to customers through Qubit Data Exchange Live Tap. Live Tap provides full access to all the data in your Qubit data layer through a cloud-based high performance query platform, which combines high speed, low latency, data exploration, and analysis and is powered by Google BigQuery, opening up this data source to most popular BI and data integration tools.

Why Use the Looker Qubit Source Block?

There are some key use cases that are central to personalization analytics: 

* post-test analysis, 

* segment and cohort analytics, 

* Understanding customer behavior and preferences,

* And understanding on-site activity down to the individual event level.  

For Qubit customers who have licensed Live Tap, sample content is provided for the Looker reporting tool including this Looker source block for connecting to the base retail schema for Qubit Live Tap. Qubit can provide your organization with access to Looker if you do not already use it at your organization, and we also have versions of this source block for gaming and travel industry customers along with sample dashboards and looks.

Looker has two unique features that are essential for conducting analysis on data from the Qubit platform.

1. It provides a business semantic model over our granular event-level data store making it more suitable for querying by marketers

2. Its compatibility with our Live Tap architecture, as it can work directly with Google BigQuery rather than extracting just a subset of your data into a query cache 

The semantic model for Live Tap in Looker joins together all of the Live Tap Business Views and presents brands’ Qubit data as subject areas, measures and dimensions - so you can use the Looker point-and-click functionality in a frictionless analysis environment.

![image alt text](image_0.png)

### **Live Tap Data Structure and Schema**

Looker’s Qubit Block is designed to work with the Qubit Live Tap retail schema; source blocks for gaming and travel industry customers can be obtained from your Qubit representative.

Business Views are a set of BigQuery SQL views designed for use with Live Tap that simplify reporting and analysis tasks by:

* Removing columns and tables from the model that aren’t relevant for reporting and analysis work, for example by excluding from the qp_bi_view business view the following ecViewevent table columns that are either not relevant for reporting, or are not usually populated:

meta_* fields e.g. meta_batchTs
context_* e.g. context_latestViewTs, context_latestSessionTs
store_address*
user_address*

* Combining data items from multiple underlying event tables into single views for segments, views, experiences, and other reporting entities, for example by creating the qp_bi_productview that combines together columns from the ecProduct, ecBasketItem, and ecBasketItemTransaction event tables

* *Baking in* best practice joins and data access paths between these underlying tables to ensure efficient data access and avoid double-counting of event activity. For example, making segments easily accessible by joining segment and view events from the underlying data layer event tables to create the qp_bi_segment business view that contains one row for every view in the context of segment the user is in at a particular point in time

Business Views are available to all Live Tap customers and are automatically provisioned by Qubit using the most appropriate industry model for the customer.

Each business view contains measures and dimension attributes relating to a particular subject area and additional metadata to describe the purpose of each view column. Views can be joined together for cross-subject area reporting. For example, by combining a conversion rate view with an average transaction value view we can report on an experience broken down by segment.

## Core Business Views and Industry-Specific Product Views

The core set of business views covers the common set of metrics, subject areas, and dimensions common to all verticals supported on the Qubit platform. These core business views may be extended and enhanced from time-to-time to include new metrics and subject areas. You can still directly query the underlying event tables if a column or subject area you require is not yet present in the business views.

The following core business views are available for all Qubit customers that have Live Tap data access:

* Views

* Sessions

* Entrances

* Transactions

* Segments Membership

* Experiences

* Goal Achieved

* Attribution

* Visitor pulse (and Visitor pulse Lite)

* User Action

In addition, three industry-specific product business views are provided for eCommerce, Travel, and eGaming industry customers:

* Product Interaction and Sales (for e-Commerce Industry customers, included in this Looker source block and as shown in the diagram below)

![image alt text](image_1.png)

* Package Interaction and Sales (for Travel Industry customers, available from your Qubit representative)

* Bet Interaction and Sales (for e-Gaming Industry customers, available from your Qubit representative)

When brought together, these core views plus any industry-specific ones make up the Industry Business Models described in the next section.

### **Customizing the Qubit Source Block for Client-Specific Live Tap Schemas**

If you are a Qubit partner and plan to use your own instance of Looker for connect to Qubit's QShopdemo training dataset the repo can be used "as is". If you are a Qubit retail vertical customer hosting your own instance of Looker and wish to use this repo to connect to your Live Tap dataset, run the following commands from the Mac OS X or Linux terminal clone the repo and then search-and-replace all occurences of the demo tracking ID and project ID in the repo with the ones for your client project and tracking ID:

```sudo apt-get install git # for Debian/Ubuntu users
brew install git # for Mac OS X users with Homebrew installed

git clone git://github.com/QubitProducts/looker-source-block.git

find . -type f -print0 | xargs -0 perl -pi -e 's/studio/TRACKING_ID/g'
find . -type f -print0 | xargs -0 perl -pi -e 's/37299/PROJECT_ID/g'
for f in *.l*; do mv $f ${f/TRACKING_ID/qshopdemo}; done```

for example, for the tracking ID "mydemoshop" and client project ID "30999" you would run the commands:

```find . -type f -print0 | xargs -0 perl -pi -e 's/studio/mydemoshop/g'
find . -type f -print0 | xargs -0 perl -pi -e 's/37299/30999/g'
for f in *.l*; do mv $f ${f/TRACKING_ID/mydemoshop}; done```

Finally, commit your changes back to the git repo.

```git add .
git commit -m "added our tracking ID and project ID"```

### **Extending the Qubit Source Block With Additional Fields, Views etc**

All of the example Looker reports and business models, along with the underlying Live Tap Business Views we provide to customers, as getting-started educational material, is designed to be amended, extended, or customized by customers or Qubit partners. This can be done on the understanding that only the QProtocol event tables we ingest data into are formally maintained and supported.

Qubit will support customers customizing or extending our supplied business views and Looker content on a 'best-endeavours' basis if the guidelines in this section are followed. It is also important to keep regressions that might be introduced by customized content or by any subsequent changes or upgrades we make to the base example content we ship for Live Tap, to an absolute minimum, .

As part of model release cycle, Qubit may modify the contents of this example Looker block or extend it with new fields, views or LookML dashboards. If you plan to clone this repo again in the future and incorporate those changes into your Looker repo you must ensure that your customizations are saved in the files ending with v01, or in a new file.

If you make changes to _base files and then incorporate any such repo updates into your model they will be lost in the next release or update by Qubit. We also recommend that you do not suffix your custom files with _base.

The following customization use cases are listed in order of complexity, and are intended to be followed by customers or partners looking to customize our example content; each link goes through to the relevant section in our docs site.

* [Adding a new column to an example dashboard](https://docs.qubit.com/content/using-qubit/vcdx-live-tap-extending-customizing#adding-a-new-column-to-an-example-dashboard "Adding a new column to an example dashboard")
* [Adding a new derived field to the Live Tap Looker Model](https://docs.qubit.com/content/using-qubit/vcdx-live-tap-extending-customizing#adding-a-new-derived-field-to-the-live-tap-looker-model "Adding a new derived field to the Live Tap Looker Model")
* [Adding a new derived field to a business view and then to Live Tap Looker model](https://docs.qubit.com/content/using-qubit/vcdx-live-tap-extending-customizing#adding-a-new-derived-field-to-a-business-view-and-then-to-live-tap-looker-model "Adding a new derived field to a business view and then to Live Tap Looker model")
* [Adding an uploaded dataset as a new subject area to Live Tap Looker model](https://docs.qubit.com/content/using-qubit/vcdx-live-tap-extending-customizing#adding-an-uploaded-dataset-as-a-new-subject-area-to-live-tap-looker-model "Adding an uploaded dataset as a new subject area to Live Tap Looker model")
* [Adding uploaded dataset columns to the Live Tap Looker Model](https://docs.qubit.com/content/using-qubit/vcdx-live-tap-extending-customizing#adding-uploaded-dataset-columns-to-the-live-tap-looker-model "Adding uploaded dataset columns to the Live Tap Looker Model")

