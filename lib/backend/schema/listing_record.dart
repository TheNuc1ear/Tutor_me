import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'listing_record.g.dart';

abstract class ListingRecord
    implements Built<ListingRecord, ListingRecordBuilder> {
  static Serializer<ListingRecord> get serializer => _$listingRecordSerializer;

  @nullable
  String get className;

  @nullable
  String get classSize;

  @nullable
  String get date;

  @nullable
  String get location;

  @nullable
  String get time;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ListingRecordBuilder builder) => builder
    ..className = ''
    ..classSize = ''
    ..date = ''
    ..location = ''
    ..time = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('listing');

  static Stream<ListingRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ListingRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ListingRecord._();
  factory ListingRecord([void Function(ListingRecordBuilder) updates]) =
      _$ListingRecord;

  static ListingRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createListingRecordData({
  String className,
  String classSize,
  String date,
  String location,
  String time,
}) =>
    serializers.toFirestore(
        ListingRecord.serializer,
        ListingRecord((l) => l
          ..className = className
          ..classSize = classSize
          ..date = date
          ..location = location
          ..time = time));
