# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* Creating new endpoints
  ## API Documentation

  This project uses [OasRails](https://github.com/a-chacon/oas_rails) to auto-generate an
  OpenAPI spec from controller comments, which is then used to generate the TypeScript API
  client for the frontend.

  ### Rules for documenting endpoints

  Every controller action **must** include OasRails comments for its summary, request     
  body, and response shapes.

  **Always use named input/output classes** — never inline types. This ensures the        
  generated OpenAPI spec produces clean, named TypeScript interfaces on the frontend.

    - Request body classes live in `app/models/inputs/`
    - Response body classes live in `app/models/outputs/`

  **Example:**

  ```ruby                                                                                 
  # @summary Register a user                                                              
  # @request_body The user to be created [!Inputs::RegisterInput]                         
  # @response Successful registration [201] [Outputs::AuthResponse]                       
  def register                                                                            
                                                                                          
  Inline types like Hash{email: String} are not allowed — they generate anonymous or      
  unreadable TypeScript types.
    ```