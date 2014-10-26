API Endpoint for SD AngularJS coding challenge - October 27, 2014

### Endpoint
The domain to the endpoint is here: https://still-island-8402.herokuapp.com/
All requests must have the following access token *as part of the URL*, "SD-AngularJS"

Example request to get all presentations:
GET https://still-island-8402.herokuapp.com/?token=SD-AngularJS

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
