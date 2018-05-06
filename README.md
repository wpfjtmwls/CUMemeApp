# CUMeme
This is IOS App for viewing and sharing Cornell Memes

### Snaps
[![Demo for the app](https://img.youtube.com/vi/-npUVmvDz3A/0.jpg)](https://www.youtube.com/watch?v=-npUVmvDz3A)


### Purpose and features
CUMeme is an ios app for cornell students to share/view their own memes.
Features include:
1. View all memes under main category 
2. View all memes under one of subcategories
3. View all memes with a certain tag
4. Post your own meme
5. Delete your own meme

### IOS requirements

As seen in the demo, we fulfilled all the requirements for IOS app
- [x] Autolayout 
- [x] CollectionView or TableView
- [x] Navigation
- [x] API : existing API obtained from the internet: https://developers.giphy.com/docs/

### Backend requirements

I have an API designed using Flask, database modeling using SQL alchemy. Deployment is done by using Postgres database instance on AWS, docker, and Kubernete engine on Google Cloud.

### Backend Design

We have deployed on Google Cloud with the public ip address http://35.192.155.168:5000/

#### Get memes by name
`Get /memes?name={name}`

Gets all memes with the provided name

```json
[
  {
    "category": "cornell life", 
    "description": "this is cornell image about extreme weather", 
    "img_url": "https://goo.gl/images/38ZpDc", 
    "name": "cornell_weather_meme", 
    "subcategory": "weather", 
    "userid": "ay244"
  }
]
```

#### Get memes by category
`Get /memes?category={category}`

Gets all memes under the main category

```json
[
  {
    "category": "cornell life", 
    "description": "this is cornell image about extreme weather", 
    "img_url": "https://goo.gl/images/38ZpDc", 
    "name": "cornell_weather_meme", 
    "subcategory": "weather", 
    "userid": "ay244"
  }
]
```

#### Get memes by subcategory
`Get /memes?subcategory={subcategory}`

Gets all memes under the subcategory

```json
[
  {
    "category": "cornell life", 
    "description": "this is cornell image about extreme weather", 
    "img_url": "https://goo.gl/images/38ZpDc", 
    "name": "cornell_weather_meme", 
    "subcategory": "weather", 
    "userid": "ay244"
  }
]
```


#### Post a new meme
`Post /memes?userid={userid}&category={category}&subcategory={subcategory}&img_url={img_url}&description={description}&name={name}`

Post a new meme to the app

```json
  {
    "success": "true"
  }
```

#### Update a meme's name and description
`Post /memes?userid={userid}&description={description}&name={name}&new_description={new_description}&new_name={new_name}`

Updates the existing meme's name and description with new name and description

```json
  {
    "success": "true"
  }
```

#### Delete a meme
`DELETE /memes?userid={userid}&name={name}`

Delete a meme 

```json
{
	"success": "true"
}
```

### Let graders know
We configured the backend deployment at 10pm on the day of deadline, so the full integration between frontend and backend is not done as the date of May/6th/2018. But we will integrate soon in several days. We learned a lot through the process, so we are still satisfied what we have so far. 


