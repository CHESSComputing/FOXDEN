## FOXDEN web tutorial
In this tutorial we will walk through
[FOXDEN infrastructure](https://chesscomputing.github.io/FOXDEN/docs/introduction.html).
[Current system](https://chesscomputing.github.io/FOXDEN/docs/current-system.html)
consists of loosely coupled services which helps you organize your (meta-) data
and provide traceability of your analysis workflows from acquiring the data to
final physics analysis, including DOI publication.

FOXDEN provides web UI and Command Line Interface (CLI).

### FOXDEN web interface
For our tutorial we will use a demo version of FOXDEN infrastructure.
We will also rely on set of pre-populated records available at
[FOXDEN demo repository](https://github.com/CHESSComputing/FOXDEN/tree/main/demo)

To proceed please navigate to this foxden-demo URL and follow these steps:

#### Authentication page
First time you access FOXDEN you'll be prompted for your
CLASSE credential via FOXDEN authentication page:

![FOXDEN_auth](images/FOXDEN_auth.png)

#### Main (dataset table) page
After that, you will be navigated to main FOXDEN
page which will show available datasets:

![FOXDEN_dstable_page](images/FOXDEN_dstable_page.png)


#### Services page
FOXDEN provides many services which are available from services page

![FOXDEN_services_page](images/FOXDEN_services_page.png)

#### Metadata service
One of the many FOXDEN services is Metadata services. It provides a web
form to inject your metadata record:

![FOXDEN_meta_web_page](images/FOXDEN_meta_web_page.png)

Once we'll inject the metadata record you'll be given
either *success* or *failure* pages. 

Here is an example of success page(s) where you can see your record details:

![FOXDEN_meta_success2](images/FOXDEN_meta_success2.png)

![FOXDEN_meta_success_page](images/FOXDEN_meta_success_page.png)

On failure page you'll be given some details of failed injection

![FOXDEN_meta_failure](images/FOXDEN_meta_failure.png)

#### Search page
On FOXDEN search page you will be prompted to provide your query

![FOXDEN_search_page](images/FOXDEN_search_page.png)

And, there is a minimal help to get you started

![FOXDEN_search_help](images/FOXDEN_search_help.png_)

A simple FOXDEN query is `{}` which means no conditions and it
return all metadata record

![FOXDEN_query_page](images/FOXDEN_query_page.png)

For more complicated query please refer to help section of search page

#### Results page
This is an example of results page showing few metadata records

![FOXDEN_results_page](images/FOXDEN_results_page.png)
