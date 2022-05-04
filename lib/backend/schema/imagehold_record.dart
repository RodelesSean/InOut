import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'imagehold_record.g.dart';

abstract class ImageholdRecord
    implements Built<ImageholdRecord, ImageholdRecordBuilder> {
  static Serializer<ImageholdRecord> get serializer =>
      _$imageholdRecordSerializer;

  @nullable
  String get imagehold;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ImageholdRecordBuilder builder) =>
      builder..imagehold = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('imagehold');

  static Stream<ImageholdRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ImageholdRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ImageholdRecord._();
  factory ImageholdRecord([void Function(ImageholdRecordBuilder) updates]) =
      _$ImageholdRecord;

  static ImageholdRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createImageholdRecordData({
  String imagehold,
}) =>
    serializers.toFirestore(ImageholdRecord.serializer,
        ImageholdRecord((i) => i..imagehold = imagehold));
