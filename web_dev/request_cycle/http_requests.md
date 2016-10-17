1. What are some common HTTP status codes?

1xx Informational
-request received, continuing process.
2xx Success
-action requested by client was received, understood, accepted, and processed
3xx Redirection
-client must take additional action to complete the request.
4xx Client Error
-intended for situations in which the client made an error.
5xx Server Error
-server failed to fulfill valid request

(via Wikipedia)


2. What is the difference between a GET request and a POST request? When might each be used?

GET: Requests data from a specified resource
-can be cached & bookmarked
-remain in browser history
-should never be used when dealing with sensitive data
-length restrictions
-should only be used to retrieve data

POST: Submits data to be processed to a specified resource
-never cached, never bookmarked
-no restrictions on data length

GET might be used to retrieve information from an API.
POST might be used when logging in to a website or when submitting credit card information.

(via w3schools)


3. What is a cookie? How does it relate to HTTP requests?

A cookie is a small piece of data that a server sends to the user's web browser. It is typically
used to know if two requests came from the same browser (i.e., to keep a user logged-in).

Cookies are mainly used for three purposes:
- Session management
- Personalization
- Tracking

(via developer.mozilla.org)
