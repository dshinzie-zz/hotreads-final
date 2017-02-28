# HotReads

HotReads is a index of the most popular links that are coming from application UrlLockbox. The site will aggregate the top 10 links over the past 24 hours.

## Functionality
### Index
HotReads is connected to UrlLockbox through a message queue. As links are marked as read from the third party site, a new Link record is created in HotReads.

### API
Hotreads has two API endpoints, one for the top ten links and another for the most popular link

Top Link:
```shell
/api/v1/top_link
```

Top Ten Links:
```shell
/api/v1/top_ten
```

Endpoints will return as JSON and will display the URL for the endpoints.

## Testing
Message queues were mocked through BunnyMock. 

## Technology
The application is currently using the following technlogies:

* Server: Ruby On Rails 5.0.1
* Client-side: ERB
* Database: PostgreSQL
* Libraries: JQuery, BunnyMQ

