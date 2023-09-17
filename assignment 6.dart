import 'package:flutter/material.dart';

void main() {
  runApp(PhotoGalleryApp());
}

class PhotoGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PhotoGalleryScreen(),
    );
  }
}

class PhotoGalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photo Gallery"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Welcome to the Photo Gallery!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Search Photos",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
              itemCount: photoList.length,
              itemBuilder: (BuildContext context, int index) {
                return PhotoCard(photoList[index]);
              },
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Sample Photos",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            for (int i = 0; i < samplePhotos.length; i++)
              ListTile(
                leading: Image.asset(samplePhotos[i].imageUrl),
                title: Text(samplePhotos[i].title),
                subtitle: Text(samplePhotos[i].subtitle),
              ),
            ElevatedButton.icon(
              onPressed: () {
                // Show a Snackbar when the upload button is pressed
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Photos Uploaded Successfully!"),
                  ),
                );
              },
              icon: Icon(Icons.cloud_upload), // Upload icon
              label: Text("Upload Photos"),
            ),
          ],
        ),
      ),
    );
  }
}

class PhotoCard extends StatelessWidget {
  final Photo photo;

  PhotoCard(this.photo);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: GestureDetector(
        onTap: () {
          // Show a Snackbar when the image is tapped
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("You tapped on: ${photo.caption}"),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              photo.imageUrl,
              fit: BoxFit.cover,
              height: 100, // Adjust the height here to make photos smaller
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                photo.caption,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Photo {
  final String imageUrl;
  final String caption;

  Photo(this.imageUrl, this.caption);
}

class SamplePhoto {
  final String imageUrl;
  final String title;
  final String subtitle;

  SamplePhoto(this.imageUrl, this.title, this.subtitle);
}

List<Photo> photoList = [
  Photo(
    "https://via.placeholder.com/150?text=Game+Poster+1", // Placeholder game poster 1
    "Game Poster 1",
  ),
  Photo(
    "https://via.placeholder.com/150?text=Game+Poster+2", // Placeholder game poster 2
    "Game Poster 2",
  ),
  Photo(
    "https://via.placeholder.com/150?text=Game+Poster+3", // Placeholder game poster 3
    "Game Poster 3",
  ),
  Photo(
    "https://via.placeholder.com/150?text=Game+Poster+4", // Placeholder game poster 4
    "Game Poster 4",
  ),
  Photo(
    "https://via.placeholder.com/150?text=Game+Poster+5", // Placeholder game poster 5
    "Game Poster 5",
  ),
  Photo(
    "https://via.placeholder.com/150?text=Game+Poster+6", // Placeholder game poster 6
    "Game Poster 6",
  ),
];


List<SamplePhoto> samplePhotos = [
  SamplePhoto(
    "images/book_1.jpg",
    "Sample 1",
    "Subtitle 1",
  ),
  SamplePhoto(
    "assets/sample2.jpg",
    "Sample 2",
    "Subtitle 2",
  ),
  SamplePhoto(
    "assets/sample3.jpg",
    "Sample 3",
    "Subtitle 3",
  ),
];
