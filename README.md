⤷  filewatcher 'Gemfile *.rb'  'rspec coolpay_api_spec.rb:43'
Run options: include {:locations=>{"./coolpay_api_spec.rb"=>[43]}}
"315dd84c-b69b-4533-a41f-ce27480f3834"
F

Failures:

  1) CoolpayAPI Integration add recipients adds a recipient
     Failure/Error: expect(add_recipients([alice, bob])).to be_truthy

     RestClient::Unauthorized:
       401 Unauthorized
     # ./coolpay_api.rb:20:in `add_recipients'
     # ./coolpay_api_spec.rb:48:in `block (3 levels) in <top (required)>'

Finished in 0.21589 seconds (files took 0.25273 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./coolpay_api_spec.rb:44 # CoolpayAPI Integration add recipients adds a recipient

-----
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
