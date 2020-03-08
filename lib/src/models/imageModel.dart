import 'dart:convert';
import 'dart:math';

class ImageModel{
  var id;
  String author, url;

  ImageModel(this.id, this.author, this.url);

  ImageModel.fromJson(data){
    var parsedJson;
    try{
      parsedJson = json.decode(data);
    }catch(e){
      var rand = new Random.secure();
      new ImageModel.fromJson('https://picsum.photos/id/${rand.nextInt(1000)+1}/info');
    }
    id = parsedJson['id'];
    author = parsedJson['author'];
    print(id);
    url = 'https://i.picsum.photos/id/$id/400/300.jpg'; //parsedJson['download_url'];
  }
}