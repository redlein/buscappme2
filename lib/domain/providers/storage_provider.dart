import 'dart:convert';
import 'dart:io';
import 'package:buscappme/domain/models/busqueda_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StorageImageProvider with ChangeNotifier {
  File? image;
  String? nameImage;

  //BD
  String urlbase = 'https://tfscdnfyqymsvuhirhdi.supabase.co/rest/v1/busquedas';
  String keydb =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRmc2NkbmZ5cXltc3Z1aGlyaGRpIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzE2MzI4NjEsImV4cCI6MTk4NzIwODg2MX0._Gwnv4hM69kBd_ai_dQ3TmpJ2Xl1rmNQvuoDpD24xIE';
  String autorization =
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRmc2NkbmZ5cXltc3Z1aGlyaGRpIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzE2MzI4NjEsImV4cCI6MTk4NzIwODg2MX0._Gwnv4hM69kBd_ai_dQ3TmpJ2Xl1rmNQvuoDpD24xIE';

  //SUPABASE STORAGE
  final SupabaseClient client = SupabaseClient(
    'https://tfscdnfyqymsvuhirhdi.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRmc2NkbmZ5cXltc3Z1aGlyaGRpIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzE2MzI4NjEsImV4cCI6MTk4NzIwODg2MX0._Gwnv4hM69kBd_ai_dQ3TmpJ2Xl1rmNQvuoDpD24xIE',
  );

  //=======================================================

  //SUBIR LA IMAGE A STORAGE
  Future subirImageStorage() async {
    final file = File(image!.path);

    final ruta0 = '/data/user/0/com.example.buscappme/cache/$nameImage';
    final ruta1 = image!.path.replaceAll(
      'data/user/0/com.example.buscappme/cache',
      'IMG',
    );
    final ruta2 = image!.path.replaceAll(
      'data/user/0/com.example.buscappme/app_flutter',
      'IMG',
    );

    final newPath = (image!.path == ruta0) ? ruta1 : ruta2;

    final response = await client.storage.from('buscappme-storage').upload(newPath, file);

    activeCleanImage();
    notifyListeners();
  }

  //CAMARA
  Future activeCamaraImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final imageTemp = File(image.path);
    //El nombre del archivo
    nameImage = image.name;
    this.image = imageTemp;
    notifyListeners();
  }

  //GALERIA
  Future activeGalleryImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemp = File(image.path);
    nameImage = image.name;
    this.image = imageTemp;
    notifyListeners();
  }

  //LIMPIAR IMAGEN
  Future activeCleanImage() async {
    image = null;
    notifyListeners();
  }
}
