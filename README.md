# Streetlight - T2A2 Rails Assessment, Coen Drexler



## Streetlight:  What is it, and what problem does it solve?

Modern commerce applications allow their users access to an ever growing number of products, with a complex and global web of reach, however, this comes with the cost of compromising the encouragement of local, user-to-user (and if possible, pick-up/meet-up exhange based) barter.  This over-reliance on shipped and imported goods has significant impacts on local industry and dramatic environmental implications.  

I plan to solve this problem by developing and providing a geographically oriented selling/purchasing platform, referred to as Streetlight. It will allow users wishing to sell items to register an account under their desired username and address, which can then be used to sell items, themselves organized into categories (in this app, these are referred to as buckets). 

These categories may be named according to the category of item it contains (i.e: Musical Instruments), or more simply according to the general theme of the items it contains (i.e 'Yard sale').

When browsing products, the user interface is designed to be more interactively driven than passively.  It revolves around the use of a map that when loaded will center on the users location, allow for navigation of the general vicinity, and any other users that may be within that region.  These other users are displayed as areas, rather than a specific point, for safety reasons. 

In this browsing format, items/categories are sorted by their proximity, and allows users to barter locally, potentially and hopefully skipping any need for shipping costs.  This saves both the seller, and the buyer, (as well as potentially the Streetlight platform) money throughout the transaction, and limits any risks that would be taken in transporting items.  

When browsing, users are able to see the seller's username, and can then use the in-app messaging system to facilitate basic barter privately.  Once an agreement has been met, a user may send the money using the in-app payment portal, or a more unconventional exchange may be made.  

This process places the users of the platform at the forefront of the experience, rather than simply products, and provides a regional marketplace platform that with more users and more development, becomes exponentially more tangibly useful.  

### Why does this problem need to be solved?

The modern consumer age is multi-faceted, and as both the transportation and production of goods becomes more expensive, and the resources these processes are reliant on become ever more sparce, we will need to prioritise proximity, recycling, reuse, and the utilisation of what is available around us when it comes to shopping.  Therefore, the aim of Streetlight conceptually is to provide a means of encouraging and facilitating communal bartering, both to save users money, but also to minimise consumer reliance on shipping, in the process demonstrating the functionality and potential of regional item exchange.  

It is a matter of inevitability that as the financial impact become too great to consumers over time, especially to the majority to whom shopping convenience is the smallest contributing factor, rather opting to shop based on product ranges and prices. 

Streetlight combines both of these two fundamental characteristics of the modern consumer market, and while it may not necessarily represent the currently most 'standard' shopping option, as time progresses and options for consumers become more scarce, options like eBay, Gumtree, and potentially something in the spirit of Streetlight are able to provide increasingly significant value for money, and fundamentally, that is wht the idea is viable, because it provides genuine value for money, and value for time.  

Supporting and influential articles: 

- https://www2.deloitte.com/us/en/insights/industry/retail-distribution/holiday-retail-sales-consumer-survey.html?nc=1
- https://www.geekwire.com/2019/amazon-shipping-costs-hit-record-9b-latest-quarter-total-nearly-28b-2018/

## Where can Streetlight be accessed?

### Heroku MVP+ release: https://mysterious-coast-47299.herokuapp.com/
### Github repository: https://github.com/Coencidental/t2a2-marketplace-assignment

## Streetlight - A topdown analysis and general description

### Purpose

As a concept, the purpose of 'Streetlight' is to demonstrate a far more efficient, engaging and straightforward approach to the 'typical' community driven marketplace application.  While still simplistic in MVP stages, by centering the user experience on the proximity aspect of user-to-user barter, and most especially by emphasizing the direct appeal of instant acquisition of purchased goods over the internet, Streetlight targets a very broad, yet largely uncatered to demographic in a manner that is not only profitable to users and potential investors, but also performs this in an ethical and environmentally progressive fashion.  

Conceptually, it appeals to basic, reliable aspects of the modern consumer (particularly at the point it becomes more generally profitable to purchase locally, rather than internationally/abroad). 

### Functionality

The functionality of Streetlight is as a minimal interface, multi-platform and extensible framework to support for a diverse market ecosystem.  Reliant on user activity and location information, it is built with user privacy as a driving principle.  In order to access any features of Streetlight, a user must first be logged in, and have provided their location.  This is done through text input, (which is then processed into usable location information)

### Sitemap

The Streetlight sitemap is available at 'docs/planning/site_map.png', or alternatively at https://drive.google.com/file/d/1DIEKTmQH2cZXjtuXCP3Kulih4hQj9uqW/view?usp=sharing

### Screenshots

All screenshots are available at 'docs/examples/Screenshot (x).png', or alternatively at https://drive.google.com/drive/folders/19RgxBaEprdA1sL0K4sgJV2RDv68YqzyG?usp=sharing

### Target Audience

As mentioned before, Streetlight is designed to conceptually appeal to a very diverse demographic.  It is intended to host anything users have to sell and exchange, and especially to facilitate both conventional and unconventional means of barter.  

In doing so, and by doing so through a local/proximity based system, there is genuine and straightforward value to users.  This means Streetlight particularly targets those who have a 'price and proximity oriented' browsing/purchasing process. 


### Tech Stack

Streetlight utilises a very simple but extensible tech stack of:

- Front End:

  - CSS
  - SCSS/SASS
  - Bulma Framework

- Back End:

  - Ruby on Rails application framework
  - PostgresQL


## User Stories:

All user stories are accessible online at: 

https://docs.google.com/spreadsheets/d/1IfTSPspJQ_SWgLiBaWXZ3skLADvthpWR4TQH2eACw2A/edit?usp=sharing

Otherwise, they can be located at 'docs/planning/user_stories.pdf'

## Wireframes:

All wireframes are available at 'docs/planning/wf_(x).png', or alternatively at https://drive.google.com/drive/folders/1_kQjisdjRtWFhih13zre9UItkVHawziE?usp=sharing

## Database Design:

Based on the fundamental functions users would undertake when using Streetlight, (purchasing, browsing, messaging, selling, etc), much of the specific structure was outlined early into the planning process.  

It was known that the database would require a model for:

- Users
- Categories of items
- Items
- Conversations between users to facilitate barter
- Messages inside of those conversations
- Orders containing an item (singular, smaller scope for this project)
  > For extensibility, this should be developed into a shopping basket type system in the future.

### ERD:

An online copy of the ERD is available at:

https://drive.google.com/file/d/1Xr9VTOw54ziUUz4frpYU_FXTaZkK2sTR/view?usp=sharing

Otherwise, an attached copy is located at '/docs/planning/T2A2 ERD.jpg'.


### ERD Breakdown:

When designing data flow throughout the application, I started with the User model, and branched out, feature by feature, to reflect the user stories, and the known models I had drawn from that.  

A User would have at least one role, a location, and conversations, as well as would require buckets, each of which would require items, each of which join to tag-words.  

Mapping things out in respect to user experience in this way, it was relatively simple to outline the basic requirements of each model relative to each other, and to map out the specific data I wanted each to contain. 

Manipulating Active Record associations simplifies the layout of data, especially so in a simple two-sided marketplace application such as Streetlight.  These are the associations that the core of the application relies on:

- User to Location: enables location/geolocation services in Streetlight
- User to Conversations: enables private 'message rooms', to allow for private message, and retrieval by relevant users.
- User to Messages:  enables private messaging, and retrieval by relevant users.
- User to Buckets: enables association of respective bucket items with an owner.
- Buckets to Items: enables association of items with a bucket.
- Tagword to Items: enables filtering and global classification of items.

### Schemas:

#### User:
    Email : String
    Password : String
    Username : String

#### Location:
    User : References
    Address : Text

    ( EVALUATED AFTER VALIDATION WITH GEOCODER GEM: )

    Latitude : Float
    Longitude : Float

#### Conversation:
    Sender : References
    Receiver : References

#### Message:
    User : References
    Conversation : References
    Body : Text

#### Items Category (Bucket):
    User : References 
    Name : String
    Description : Text

#### Item:
    Bucket : References
    Name : String
    Price : Decimal
    Brand : String
    Description : Text
    Returnable : Text
    Sold : Boolean

#### Tagword:

    Tag : String

#### Item Tagword:

    Tag : References
    Item : References

## Task allocation during development

In order to keep track of required tasks during the two week period, I used a physical whiteboard to map out the features I required.  Due to a lot of the changes that the design had to undergo during development, it was far simpler to be able to wipe out a section of the whiteboard and replace it with desired changes.


### Third party services:

There are a number of external services and gems in use within Streetlight:

#### - Google JavaScript Maps API: user positioning and geocoding services
#### - Geocoder gem: acts as the glue between the user location models and geocoding services 
#### - Devise gem: user registration and authentication
#### - Rolify: user role assignment and authorization
#### - Bulma: basic styling to make MVP experience more pleasant
#### - Stripe API: to provide a professional, secure and reliable cloud payment service
#### - Cloudinary: image/file hosting service


## Application Components

For the function of a two-sided user to user marketplace application, particularly with location integration, several particular components are integral.  These are easiest to map out according to the particular function the user is performing, and what are actions are dependent:

- Logging in / Signing Up for Streetlight:

In order to handle the user security implications of authentication, particularly when considering potentially sensitive information like locations and message, a third party component for such services (the Devise gem as mentioned above) is implemented within Streetlight.  This component is responsible for handling user, encrypting relevant information (the password), and comparison functions so that a user can be authenticated (whether successfully or unsuccessfully).  

A simpler alternative to this would have been to handle the user information within the application itself, as it has been designed as to not require sensitive information (other than locations), and to use the default Rails equipped GCRYPT gem to handle password encryption.  However, mostly for extensibility, I opted for an external, robust solution with industry standard security.  



- Associating an interpretable location object with the user:

In order to create an interface and user experience with locations and user proximity as a driving focus, it was necessary to implement some form of geocoding component/s to Streetlight.  Two separate functions were required simutaneously.

Firstly, a user address needed to be parsed from a string/text input to a latitude and longitude. To do this, the Google Maps Javascript API service was used.  Then, secondarily, to display the location as a map, this position is passed back into the Google Maps API to return an interactive JavaScript map.  

This all happens with different contexts, however, from user account registration, to browsing, and displaying particular pages.  In order to connect them all together, the Geocoder gem was implemented to act as a container for the location input as text, the processing/parsing into latitude and longitude, the modification of the location object to reflect these, and to pass them back to the application views in order to generate relevant and interactive maps.

- Authorizing user privileges within Streetlight

For general user experience in Streetlight, limitations to user privileges is paramount.  As such, an authorization component was required.  In this case, it is handled by Rolify, a gem for Rails.  Through rolify, a user model is associated with one or more roles, which can be used to identify particular user privileges for a given page.

- Associating and hosting image files associated with item postings:

To allow users (when they post an item they wish to sell) to upload and attach an accompanying image, (1 at this point for simplicity), Streetlight either needed the ability to manage user files, or to hook in to another api.  In this case, any likely most other cases, the latter was far more suitable.  

As such, Cloudinary was implemented within Streetlight to handle any file requirements, and with expansion, will see much more intensive use.  At this point it is only possible to attach an image to item postings, but it was particularly appealing to use a more robust service such as Cloudinary so that there is a stronger platform for extensibility.  Most particularly, user avatars to make browsing more intuitive, (as well as to take advantage of any pre-existing familiarity with locals on Streetlight), multiple image uploads (as well as potentially video uploads), and the ability to send files (not necessarily images or videos).   

In order to use Cloudinary, an account is required to access their API services, as well as the Rails gem Cloudinary itself.  This gem connects in to Active-Storage (which itself must first be installed), and allows a user to associate an 'attached' image through upload, and for other users to then retrieve this association when viewing the product.  


- Facilitating and processing a transaction between users (purchasing an item):


Finally, to allow for user-to-user transactions independently of the status of Streetlight, in a robust and secure manner with user confidence as a primary factor, the Stripe gem and API service was implemented.  

Stripe is a developer friendly alternative to PayPal, that provides simple components and intuitive set up to allow for functional and reliable payment portals within a very short time frame of work.

The function Stripe performs in this case is placing the user into a tunnel, intermediary redirect between Streetlight and Stripe, which itself is dynamically generated depending on the API call itself.  With the implementation of the Stripe gem to process the application-side requirements, only the parameters of the purchases themselves need to be passed in, and a user can directly be linked to an appropriate and reassuring payment portal.  

## Extensible Features/Future Improvements

The entire design of Streetlight is as a robust, widely applicable proof of concept in a geopositioning based marketplace application.  With such a general target group and list of required functions, the simplified model presented in the MVP release has a number of features that could use very significant extensibility considerations.  

### Mapping

The use of an interactive map was the first and most crucial aspect of Streetlight functioning as I had hoped when I conceived of it.  However, in the actual development of it, I realised that as a concept, it would work just as effectively in the first person.  With the increasing popularity of interactive, virtual mediums (VR), a truly interactive browsing experience is a very interesting concept.  As such, in the future I would like to extend Google Maps 'Street View' feature (or build something that works alongside a similiar technology) to allow the application user to follow a route in the first person, and see interactive graphics to represent the shop/user locations.

### Profiles

In this MVP demonstration, the user side of the application was not the driving focus.  As such, there is minimal significance to the profile system at this point, and there are issues with it having no associated, accountable first name and surname.  This definitely requires addressing in the future.  Additionally, the profile system would massively benefit from extra features such as user profile pictures, customized browsing experience features such as better filtering by interests, and also the implementation of a group system, where only particular people are able to see certain items or users.  This would be useful in closed-circle trade groups, such as when there are shopping promotions and collectable items, for example, but has the potential downside of facilitating local crime.  

### Messaging

As a predominant feature in the application and the user experience in purchasing/bartering, the messaging system alongside the mapping was one of the most significant technologies in the function of Streetlight.  As it exists at this point, users communicate via a simple private messaging system wherein users are associated with many conversations, and each conversation is associated with many messages.  However, the instant factor in messaging is a vital aspect to fluid and efficient conversation (or barter in this case), so all efforts should be taken in the future to extend the functionality of the user messaging system to allow for INSTANT private messaging.

Additionally, a user should be able to directly access a conversation from a profile page, so as to easily facilitate contact between users.  

### Administration

While administration privileges exist within Streetlight, the implementation is relatively spread out across the application, and as an administrator, it would be hugely beneficial to be able to perform all relevant management from a single dashboard.  This should be designed to allow efficient and thorough browsing of the website, and allow an admin to perform all necessary tasks in one place, as well as leave notes for other admins and report items.

### User experience

The user experience at this point is skeletal, reflecting only the most simple actions a user would undertake.  However, many fairly vital and commonly used tools are absent from Streetlight, most notably the ability to report users/buckets/items to administrators, comment on items, search for items EFFECTIVELY, remove and edit images from item posts, and to easily navigate between the pages required.  All of these require addressing going on from MVP status.  

