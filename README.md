# GooglePlacesAutoCompleteExecution
Simple and direct way to implement google places auto complete service on iOS

This api offers a straightforward approach to use Google's place autocomplete service. When you are trying to use google maps api for iOS, you might run into some troubles such as api key and iOS version incompatible. So instead of using google maps iOS api, I'm using Google Places API Web Service to implement places auto complete. Please follow the steps to make use of this api:

1. This api depends on AFNetworking, a strong and powerful library handling various types of HTTP requests. Please make sure you have installed the dependency of AFNetworking before using this api. Here is the link to AFNetworking: 
https://github.com/AFNetworking/AFNetworking
This link offers the approach to download AFNetworking and integrate into your project.

2. Login to your google developer console. On the left menu, choose APIs & Auth -> Credentials -> Add Credentials(right side view) -> API Key -> Browser Key. After this step, you will get you google api key.

3. Still in your google developer console, go to APIs & Auth -> APIs -> Google Maps APIs -> More -> Google Places API Web Service -> Enable API. After this step, your google api key will be authorized to use Google Places Web Service.

4. Download this project, model of implementing google places autocomplete is inside Class folder. There's also an example to show you how to use this class.

5. In order to run example app and test your google developer api key, please first go to GoogleAPIKey.h file and type in your own google api key.

Hint: You may want to customize your places autocomplete request, in order to do that, you can change the "parameters" in the request. You have to include yoru google api key inside request parameter, otherwise you would not get any result. This link describes how to set parameters of your request: https://developers.google.com/places/web-service/autocomplete