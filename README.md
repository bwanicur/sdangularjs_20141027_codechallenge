API Endpoint for SD AngularJS coding challenge - October 27, 2014

### Endpoint
The domain to the endpoint is here: https://still-island-8402.herokuapp.com/
All requests must have the following access token *as part of the URL*, "SD-AngularJS"

Example request to get all presentations:
GET https://still-island-8402.herokuapp.com/?token=SD-AngularJS

### Objects
Right now there is only a Presentation object with the following attributes:
* title (string)
* presenter (string)
* presenter_link_text (string) - to link to a presenters website
* description (text)
* info_links (text)

### API
The API is RESTful and is JSON based.

* GET all presentations: GET https://still-island-8402.herokuapp.com/presentations?token=SD-AngularJS
* SHOW one presentations: GET https://still-island-8402.herokuapp.com/presentations/:id?token=SD-AngularJS
* CREATE one presentation: POST https://still-island-8402.herokuapp.com/presentations?token=SD-AngularJS
  * request body: ```
                      {
                          "presentation": {
                              "title": "TESTING TITLE",
                              "presenter": "Benny",
                              "presenter_link_text": "http://mycoolblog.com",
                              "description": "discussing something about AngularJS",
                              "info_links": "http://myslideshere.com"
                          }
                      }
                  ```
* UPDATE one presentation: PATCH https://still-island-8402.herokuapp.com/presentations/:id?token=SD-AngularJS
  * request body: ```
                    {
                        "presentation": {
                            "title": "BRAND NEW TITLE",
                        }
                    }
                  ```
* DELETE one presentation:  DELETE https://still-island-8402.herokuapp.com/presentations/:id?token=SD-AngularJS

### Keep in mind...
This application is graciously hosted on Heroku for free.  That means that sometimes the process that runs the web server might need a few second to "wake up".  Please keep that in mind when making your http requests.
