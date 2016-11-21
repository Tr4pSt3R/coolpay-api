```
 () ~/Projects/challenges/coolpay
⤷  curl --include \
>      --request POST \
>      --header "Content-Type: application/json" \
>      --header "Authorization: Bearer 12345.b782e6e0-11fe-4a53-bd4e-9aac3c20a26b.67890" \
>      --data-binary "{
>     \"recipient\": {
>         \"name\": \"Leonard\"
>     }
> }" \
```


```
> 'https://coolpay.herokuapp.com/api/recipients'
HTTP/1.1 401 Unauthorized
Connection: keep-alive
Server: Cowboy
Date: Mon, 21 Nov 2016 12:00:44 GMT
Content-Length: 27
Cache-Control: max-age=0, private, must-revalidate
Strict-Transport-Security: max-age=31536000
X-Request-Id: 7eb7c532-2d2a-4e07-a993-0b8375d09787
Via: 1.1 vegur

Please provide a good token
```
I am stumped by this "Provide a good token" issue. 
