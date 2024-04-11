# Create profile sdk

Creates user profile

## Overview

This sdk will show a form field for name, email, phone number and user image. Then it will be stored the data in user defaults. 

### Running the sdk

This is hosted in github as a swift package. 
You can download this package from this repositiory. https://github.com/samsonsunny/profile-sdk

You can install this package in your project and create user profiles using this. 

ProfileSDK.showCreateProfileView() 

This function will present a UI form field where the user can enter their name, email, phone number and image. 

This sdk will take care to store these information into user defaults. 

```ProfileSDK.profile``` this will give the stored profile details. This two are the public properties for the sdk. 

This has name, phone number, email and image information.  
